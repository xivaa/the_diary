class HabitsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_habit, only: [:destroy]

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    if @habit.save
      redirect_to goal_path(@habit)
    else
      render :new
    end
  end

  def destroy
    @habit.destroy
    redirect_to goals_path
  end

  private

  def habit_params
    params.require(:habit).permit(:name, :description, :frequency)
  end

  def set_habit
    @habit = Habit.find(params[:id])
  end
end
