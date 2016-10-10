class VenueAmenity < ApplicationRecord
  belongs_to :venue
  belongs_to :amenity
end
