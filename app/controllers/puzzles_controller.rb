class PuzzlesController < ApplicationController

  def index
    @puzzles = Puzzle.all
    @puzzles = policy_scope(Puzzle)
  end

  def new
    @puzzle = Puzzle.new
    authorize @puzzle
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    @puzzle.user = current_user
    authorize @puzzle
    # @goals = user.puzzle.goals
    if @puzzle.save
      redirect_to puzzle_path(@puzzle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    authorize @puzzle
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:title, :date, :user_id, :photo)
  end
end
