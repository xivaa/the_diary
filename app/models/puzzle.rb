class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :goals
  has_many :habits, through: :goals

  has_one_attached :photo

  validates :title, presence: true
  validates :date, presence: true
  validates :user, presence: true

  def goals
    Goal.where(puzzle: self)
  end

  def completed_goals
    goals.where(completed: true)
  end

  def completed_goals_percentage
    if goals.count > 0
      (completed_goals.count.to_f / goals.count) * 100
    else
      0
    end
  end

  def completed?
    completed_goals_percentage == 100
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
