class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  # before_action :set_puzzle, only: [:new, :create]

  def index
    @goals = Goal.all
    @goals = policy_scope(Goal)
  end

  def show
    authorize @goal
  end

  def new
    @goal = Goal.new
    authorize @goal
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.puzzle = Puzzle.last
    authorize @goal
    if @goal.save
      redirect_to goal_path(@goal)
      flash.alert = "Goal created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @goal
  end

  def update
    authorize @goal
    if @goal.update(goal_params)
      redirect_to goal_path(@goal)
      flash.alert = "Goal updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    authorize @goal
    @goal.destroy
    redirect_to goals_path
    flash.alert = "Goal deleted successfully"
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :end_date, :puzzle_id)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def set_puzzle
    @puzzle = Puzzle.find(params[:puzzle_id])
  end
end
