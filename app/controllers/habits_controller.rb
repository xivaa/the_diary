class HabitsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_habit, only: [:destroy]

  def show
    authorize @habit
  end

  def new
    @habit = Habit.new
    @goals = current_user.goals
    @goal = Goal.find(params[:goal_id])
    authorize @habit
  end

  def create
    @habit = Habit.new(habit_params)
    authorize @habit
    @habit.frequency.shift
    if @habit.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    authorize @habit
    @habit.destroy
    redirect_to goals_path
  end

  private

  def habit_params
    params.require(:habit).permit(:name, :description, :completed, :goal_id, frequency: [])
  end

  def set_habit
    @habit = Habit.find(params[:id])
  end
end
