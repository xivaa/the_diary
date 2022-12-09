class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @user = User.find(params[:id])
    @goals = @user.goals
    @habits = @user.habits
    # geocoder current location to try in production (request.location)
    # @user_location = Geocoder.search("lima, peru").first
    # api_key = ENV['OPENWEATHER_URL']
    # api_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{@user_location.latitude}&lon=#{@user_location.longitude}&appid=#{api_key}"
    # response = Net::HTTP.get(URI(api_url))
    # @weather_data = JSON.parse(response)
  end
end
