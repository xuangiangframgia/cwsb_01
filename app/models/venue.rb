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
  has_many :working_times
  attr_accessor :user

  after_create :create_user_venue

  validates :name, presence: true
  delegate :details, to: :address, prefix: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  def create_user_venue
    user_role_venues.create user: user
  end
end
