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
    @puzzle.date = Date.today
    @puzzle.user = current_user
    authorize @puzzle
    if @puzzle.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    @puzzle.goals.each { |g| g.is_completed? ? g.complete! : g.incomplete! }
    authorize @puzzle
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:title, :date, :user_id, :photo)
  end
end
