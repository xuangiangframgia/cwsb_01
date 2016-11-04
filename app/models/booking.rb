class Booking < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :space
  belongs_to :booking_type

  has_one :invoice
  has_many :notifications, as: :notifiable

  enum state: {pending: 0, requested: 1, accepted: 2, rejected: 3}

  validates :booking_from, presence: true
  validates :duration, presence: true
  validates :quantity, presence: true
  validates :user, presence: true

  delegate :name, to: :booking_type, prefix: true

  scope :without_order, -> do
    where order_id: nil
  end

  scope :have_order, -> do
    where.not order_id: nil
  end

  scope :group_by_venue, -> state do
    send(state).group_by{|booking| booking.space.venue}
  end
end
