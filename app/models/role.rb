class Role < ApplicationRecord
  has_many :permissions
  has_many :admins
  has_many :user_role_venues
  has_many :venues, through: :user_role_venues
  has_many :users, through: :user_role_venues

  validates :type, presence: true
  validates :name, presence: true
end
