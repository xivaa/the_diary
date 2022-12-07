class Goal < ApplicationRecord
  include ActiveModel::Validations
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

  def completed?
    @goal.completed = true if completed_habits_percentage == 100
  end

  def reach_limit?
    habits.size >= 5
  end
end
