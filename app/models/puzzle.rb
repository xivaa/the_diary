class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  has_many :habits, through: :goals

  has_one_attached :photo

  validates :date, presence: true
  validates :user, presence: true

  def goals
    Goal.where(puzzle: self)
  end
  # if habit.today?
  def goals_of_today
    today = []
    goals.each do |goal|
      goal.habits.each do |habit|
        today << goal
      end
    end
    today
  end

  def completed_goals
    completed = []
    goals_of_today.each do |goal|
      if goal.is_completed?
        completed << goal
        goal.complete!
      else
        goal.incomplete!
      end
    end
    completed
  end

  def completed_goals_percentage
    if goals_of_today.count > 0
      ((completed_goals.count.to_f / goals_of_today.count) * 100).round
    else
      0
    end
  end

  def completed?
    completed_goals_percentage == 100
  end

  def perform
    new_puzzle = Puzzle.new
    new_puzzle.title = "#{Date.today}"
    new_puzzle.date = Date.today
    new_puzzle.user = self.user
    new_puzzle.goals = current_user.goals
    new_puzzle.save
  end
end
