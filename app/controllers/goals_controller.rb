class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

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
    authorize @goal
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def edit
    authorize @goal
  end

  def update
    authorize @goal
    @goal.update(goal_params)
    redirect_to goal_path(@goal)
  end

  def destroy
    authorize @goal
    @goal.destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :end_date)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
