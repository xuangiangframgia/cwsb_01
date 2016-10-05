class UserRoleVenue < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :venue
end
