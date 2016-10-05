class Review < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :content, presence: true
end
