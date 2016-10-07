class Address < ApplicationRecord

  geocoded_by :details
  after_validation :geocode
  belongs_to :county, optional: true
  belongs_to :venue, optional: true
  has_many :spaces, through: :venue

  validates :details, presence: true

  before_save :build_address

  private

  def build_address
    self.latitude, self.longitude = Geocoder.coordinates(self.details)
  end
end
