# frozen_string_literal: true

class AvailabilitiesController < ApplicationController
  def index
    if Availability.none?
      response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
      response_parsed = JSON.parse response, symbolize_names: true
      stations = response_parsed[:network][:stations]
      stations.each do |station|
        Availability.create(
          empty_slot: station[:empty_slots],
          latitude: station[:latitude],
          longitude: station[:longitude],
          free_bikes: station[:free_bikes],
          name: station[:name],
          uid: station[:extra][:uid]
        )
      end
    else
      puts 'stations already exist'
    end
  end
end
