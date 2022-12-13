require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'open-uri'
require 'nokogiri'

class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @user = User.find(params[:id])
    @goals = @user.goals
    @habits = @user.habits

    # url = URI("https://theysaidso.p.rapidapi.com/quote/random?language=en")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # request = Net::HTTP::Get.new(url)
    # request["X-RapidAPI-Key"] = '3437e53e0amshe2057950905e6c9p1d91b6jsn588792ae0dcb'
    # request["X-RapidAPI-Host"] = 'theysaidso.p.rapidapi.com'

    # response = http.request(request)
    # @quote_of_day = JSON.parse(response.read_body)

    # geocoder current location to try in production (request.location)
    # @user_location = Geocoder.search("lima, peru").first
    # api_key = ENV['OPENWEATHER_URL']
    # api_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{@user_location.latitude}&lon=#{@user_location.longitude}&appid=#{api_key}"
    # response = Net::HTTP.get(URI(api_url))
    # @weather_data = JSON.parse(response)

    url = "https://www.today.com/news/good-news" # the url of the web page you want to scrape
    html = URI.open(url) # open the html of the page
    @doc = Nokogiri::HTML(html)
    @news = @doc.search('.tease-card__headline > a')[0]["href"]
    @news_title = @doc.search('.tease-card__headline > a')[0].text
  end
end
