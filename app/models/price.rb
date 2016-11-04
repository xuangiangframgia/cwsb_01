class Price < ApplicationRecord
  acts_as_paranoid

  belongs_to :space
  belongs_to :booking_type

  validates :price, presence: true, numericality: {greater_than_or_equal: 0}
end
