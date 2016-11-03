class VenueAmenity < ApplicationRecord
  acts_as_paranoid

  belongs_to :venue
  belongs_to :amenity
end
