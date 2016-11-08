class Booking < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :space
  belongs_to :booking_type
  belongs_to :order

  has_one :invoice
  has_many :notifications, as: :notifiable

  enum state: {pending: 0, requested: 1, accepted: 2, rejected: 3}

  after_update_commit :send_notification

  validates :booking_from, presence: true
  validates :duration, presence: true
  validates :quantity, presence: true
  validates :user, presence: true

  delegate :name, to: :booking_type, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :space, prefix: true, allow_nil: true

  scope :without_order, -> do
    where order_id: nil
  end

  scope :have_order, -> do
    where.not order_id: nil
  end

  scope :group_by_venue, -> state do
    send(state).group_by{|booking| booking.space.venue}
  end

  scope :load_resourse_to_reject, -> date do
    joins("INNER JOIN orders ON bookings.order_id = orders.id")
      .where "date(bookings.booking_from) = date(?) AND
        (bookings.state = ? OR state = ?) AND orders.status = ?",
        date, Settings.requested, Settings.state_pending, Settings.status_pending
  end

  private
  def send_notification
    owner_space_id = self.space.venue.user_role_venues.find_by(role_id: Role.owner).user_id
    case
    when self.rejected?
      self.notifications.create message: :rejected, receiver_id: self.user.id, owner_id: owner_space_id
    when self.requested?
      self.notifications.create message: :requested, receiver_id: owner_space_id, owner_id: self.user.id
    when self.accepted?
      self.notifications.create message: :accepted, receiver_id: self.user.id, owner_id: owner_space_id
    end
  end
end
