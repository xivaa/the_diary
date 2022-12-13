# require 'sidekiq-scheduler'

class PuzzleJob < ApplicationJob
  # include Sidekiq::Worker
  queue_as :default

  def perform
    new_puzzle = Puzzle.new(date: Date.today)
    # new_puzzle.user = current_user
    # new_puzzle.goals = current_user.goals
    new_puzzle.save
  end
end
