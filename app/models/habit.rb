class Habit < ApplicationRecord
  belongs_to :goal
  has_many :days

  validates :name, presence: true
  validates :description, presence: true
  validates_associated :goal
  validates :frequency, presence: true

  # respond_to do |format|
  #   format.html
  # end
  def today?
    date = Date.today
    self.frequency.include?(date.strftime('%A'))
  end
end
