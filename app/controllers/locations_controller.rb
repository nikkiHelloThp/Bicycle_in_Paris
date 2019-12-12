class LocationsController < ApplicationController
  def index
    if params[:search].present?
    	@result = Geocoder.search(params[:search])
      @result = @result.first.coordinates
      @locations = Availability.near(@result, 1, :order => :distance).take(5)
    else
    	@thpaddress = Geocoder.search('9 rue Bergère, Paris 75002, France')
			@thp = @thpaddress.first.coordinates
      @locations = Availability.near(@thp, 1, :order => :distance).take(5)
    end
    # returns Geocoder::Result object
    # @my_current_position = request.location
  end
end
