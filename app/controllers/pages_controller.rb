class PagesController < ApplicationController
  include ActionView::RecordIdentifier

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def dashboard
    @goals = current_user.goals
    @habits = current_user.habits
    @puzzles = current_user.puzzles
    @user = current_user
  end

  def upgrade
  end

  def contact
  end
end
