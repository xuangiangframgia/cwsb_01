class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  belongs_to :booking_type

  has_one :invoice
  has_many :notifications, as: :notifiable

  enum state: {pending: 0, requested: 1, rejected: 2}

  validates :booking_from, presence: true
  validates :duration, presence: true
  validates :quantity, presence: true
  validates :user, presence: true

  scope :without_order, -> do
    where order_id: nil
  end

  scope :requested, -> do
    where.not order_id: nil
  end
end
