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
  @url= "#{@url_base}+ #{@url_input}"

  @latitude = @url
  @longitude = "b"


    render("geocoding/street_to_coords.html.erb")
  end
end
