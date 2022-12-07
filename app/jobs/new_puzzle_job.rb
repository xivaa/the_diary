class NewPuzzleJob < ApplicationJob
  queue_as :default

  def perform
    new_puzzle = Puzzle.new
    new_puzzle.title = "#{Date.today}"
    new_puzzle.date = Date.today
    new_puzzle.user = self.user
    new_puzzle.goals = current_user.goals
    new_puzzle.save
  end
end
