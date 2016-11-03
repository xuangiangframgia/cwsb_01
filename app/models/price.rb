class Price < ApplicationRecord
  acts_as_paranoid

  belongs_to :space
  belongs_to :booking_type

  validates :price, presence: true
end
