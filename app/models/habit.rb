class Habit < ApplicationRecord
  belongs_to :goal
  has_many :days

  validates_associated :goal
end
