class Amenity < ApplicationRecord
  has_many :venue_amenities
  has_many :images, as: :imageable
  has_many :venues, through: :venue_amenities

  validates :name, presence: true
end
