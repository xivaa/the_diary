class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle
  has_many :habits, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def habits
    Habit.where(goal: self)
  end

  def completed_habits
    habits.where(completed: true)
  end

  def completed_habits_percentage
    if habits.count > 0
      (completed_habits.count.to_f / habits.count) * 100
    else
      0
    end
  end

  def is_completed?
    completed_habits_percentage == 100
  end

  def complete!
    self.completed = true
    self.save
  end

  def incomplete!
    self.completed = false
    self.save
  end
end
