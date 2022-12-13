class Goal < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :puzzle
  has_many :habits, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def completed_habits
    completed = []
    habits.each do |habit|
      if habit.today? && habit.completed
        completed << habit
      end
    end
    completed
  end

  def completed_habits_percentage
    today = []
    habits.each do |habit|
      if habit.today?
        today << habit
      end
    end

    if habits.count > 0
      (completed_habits.count.to_f / today.count) * 100
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

  def reach_limit?
    habits.size >= 5
  end
end
