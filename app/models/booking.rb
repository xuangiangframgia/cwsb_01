class Booking < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :space
  belongs_to :booking_type
  belongs_to :order

  has_one :invoice
  has_many :notifications, as: :notifiable

  enum state: {pending: 0, requested: 1, accepted: 2, rejected: 3}

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
end
