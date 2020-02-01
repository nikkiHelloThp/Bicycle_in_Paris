# frozen_string_literal: true

class Availability < ApplicationRecord
  # include HTTParty
  # base_uri 'http://api.citybik.es/v2/networks/velib'
  geocoded_by latitude: :latitude, longitude: :longitude
end
