class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Availability.near(params[:search], 1, :order => :distance).take(5)
    else
    	@thpaddress = Geocoder.search('9 rue Bergère, Paris 75002, France')
			@thp = @thpaddress.first.coordinates
      @locations = Availability.near(@thp, 1, :order => :distance).take(5)
    end

  end
end
