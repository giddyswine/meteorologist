require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords_form
    # Nothing to do here.
    render("geocoding/street_to_coords_form.html.erb")
  end

  def street_to_coords
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


    render("geocoding/street_to_coords.html.erb")
  end
end
