class WorkingTime < ApplicationRecord
  belongs_to :venue

  validates :working_from, presence: true
  validates :working_to, presence: true
  validates :day_in_week, presence: true
end
