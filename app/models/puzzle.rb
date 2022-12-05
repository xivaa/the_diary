class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :goals

  has_one_attached :photo

  validates :title, presence: true
  validates :date, presence: true
  validates :user, presence: true

  def goals
    Goal.where(puzzle: self)
  end

  def habits
    Habit.where(puzzle: self)
  end

  def completed_goals
    goals.where(completed: true)
  end

  def completed_habits
    habits.where(completed: true)
  end

  def completed_goals_percentage
    if goals.count > 0
      (completed_goals.count.to_f / goals.count.to_f) * 100
    else
      0
    end
  end

  def completed_habits_percentage
    if habits.count > 0
      (completed_habits.count.to_f / habits.count.to_f) * 100
    else
      0
    end
  end

  def completed_percentage
    (completed_goals_percentage + completed_habits_percentage) / 2
  end

  def completed?
    completed_percentage == 100
  end

  def create_a_new_puzzle
    new_puzzle = Puzzle.new
    new_puzzle.title = "#{Date.today}"
    new_puzzle.date = Date.today
    new_puzzle.user = self.user
    new_puzzle.goals = current_user.goals
    new_puzzle.save
  end
end
