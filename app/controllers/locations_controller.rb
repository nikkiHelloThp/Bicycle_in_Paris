# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    if params[:search].present?
      result = Geocoder.search(params[:search])
      @result = result.first.coordinates
    else
      @thp = '9 rue Bergère, Paris 75002, France'
      @result = Geocoder.search(@thp).first.coordinates
    end
    @locations = Availability.near(@result, 1, order: :distance).take(5)
    # returns Geocoder::Result object
    # @my_current_position = request.location
  end
end
