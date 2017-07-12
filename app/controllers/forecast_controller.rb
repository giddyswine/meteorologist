require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================
 
  @url_base= "https://api.darksky.net/forecast/cd0ec86c2d365b0d91aed359d695e355/"
  @url_input_lat = @lat
  @url_input_lng = @lng
  @url_weather= "#{@url_base}#{@url_input_lat},#{@url_input_lng}"
  @raw_dataw=open(@url_weather).read
  @jsonedw=JSON[@raw_dataw]
  @current=@jsonedw["currently"]
  @hourly=@jsonedw["minutely"]
  @fewhours=@jsonedw["hourly"]
  @daily=@jsonedw["daily"]
  @temp=@current["temperature"]


    @current_temperature = @temp

    @current_summary = @current["summary"]

    @summary_of_next_sixty_minutes = @hourly["summary"]

    @summary_of_next_several_hours = @fewhours["summary"]

    @summary_of_next_several_days = @daily["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
