class BookingType < ApplicationRecord
  has_many :bookings
  has_many :prices
  has_many :coupons

  validates :name, presence: true
end
