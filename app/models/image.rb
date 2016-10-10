class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user
  validates :image_url, presence: true
end
