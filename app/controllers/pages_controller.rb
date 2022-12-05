class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def dashboard
    @goals = current_user.goals
    @habits = current_user.habits
    @user = current_user
  end

  def contact
  end
end
