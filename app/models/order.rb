class Order < ApplicationRecord
  belongs_to :coupon
  has_many :bookings
  belongs_to :venue
end
