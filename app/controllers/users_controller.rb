class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @user = User.find(params[:id])
    @goals = @user.goals
    @habits = @user.habits
  end
end
