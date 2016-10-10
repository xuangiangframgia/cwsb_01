class Venue < ApplicationRecord
  has_one :address
  has_many :images, as: :imageable
  has_many :user_role_venues
  has_many :roles, through: :user_role_venues
  has_many :users, through: :user_role_venues
  has_many :amenities, through: :venue_amenities
  has_many :venue_amenities
  has_many :reviews
  has_many :spaces

  validates :name, presence: true
  validates :description, presence: true
end
