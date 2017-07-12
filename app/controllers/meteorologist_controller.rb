require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================
 
    @url_base= "https://maps.googleapis.com/maps/api/geocode/json?address="
    @url_input=@street_address.gsub(" ","+")
    @url= "#{@url_base}#{@url_input}"
    @raw_data=open(@url).read
    @jsoned=JSON[@raw_data]
    @results=@jsoned["results"]
    @first=@results[0]
    @geometry=@first["geometry"]
    @location = @geometry["location"]
    @latitude = @location["lat"]
    @longitude = @location["lng"]
  
  
    @url_base= "https://api.darksky.net/forecast/cd0ec86c2d365b0d91aed359d695e355/"
    @url_input_lat = @latitude
    @url_input_lng = @longitude
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

    render("meteorologist/street_to_weather.html.erb")
  end
end
