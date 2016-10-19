class WorkingTime < ApplicationRecord
  belongs_to :venue

  enum day_in_week: {SUN: 0, MON: 1, TUE: 2, WED: 3, THU: 4, FRI: 6, SAT: 7}

  validates :working_from, presence: true
  validates :working_to, presence: true
  validates :day_in_week, presence: true
end
