class Price < ApplicationRecord
  belongs_to :space
  belongs_to :booking_type

  validates :price, presence: true
end
