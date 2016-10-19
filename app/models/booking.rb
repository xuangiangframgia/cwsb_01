class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  belongs_to :booking_type

  has_one :invoice
  has_many :notifications, as: :notifiable

  validates :booking_from, presence: true
  validates :duration, presence: true
  validates :quantity, presence: true
end
