class Address < ApplicationRecord
  belongs_to :county
  belongs_to :venue

  validates :details, presence: true
end
