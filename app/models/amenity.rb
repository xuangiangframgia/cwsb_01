class Amenity < ApplicationRecord
  validates :name, presence: true

  attr_accessor :venue

  after_create :create_venue_amenity_for_venue
  has_many :venue_amenities, dependent: :destroy
  has_many :images, as: :imageable
  has_many :venues, through: :venue_amenities
  has_many :price_types, through: :service_charges
  has_one :service_charge, dependent: :destroy

  accepts_nested_attributes_for :venue_amenities
  accepts_nested_attributes_for :service_charge

  scope :select_amenities_belong_to_user, ->(venue) do
    joins(:venue_amenities).where venue_amenities: {venue_id: venue.id}
  end

  def create_venue_amenity_for_venue
    @venue_amenity = VenueAmenity.create venue_id: self.venue.id,
      amenity_id: self.id
  end
end
