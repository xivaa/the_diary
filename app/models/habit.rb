class Habit < ApplicationRecord
  belongs_to :goal
  has_many :days

  validates :name, presence: true
  validates :description, presence: true
  validates :frequency, presence: true
end
