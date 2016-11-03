class Space < ApplicationRecord
  acts_as_paranoid

  belongs_to :venue
  has_one :address, through: :venue

  has_many :images, as: :imageable
  has_many :bookings, dependent: :destroy
  has_many :prices, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :booking_types, through: :prices

  enum space_type: {desk: 0, prive_office: 1, meeting_room: 2}

  validates :space_type, presence: true
  validates :size, presence: true
  validates :capicity, presence: true
  validates :quantity, presence: true
end
