class AvailabilitiesController < ApplicationController
	def index
	response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
	@response = JSON.parse response, symbolize_names: true
	@response = @response[:network][:stations]
		@response.each do |availability|
			Availability.create(
				empty_slot: availability[:empty_slots],
				latitude: availability[:latitude],
				longitude: availability[:longitude],
				has_bikes: availability[:has_bikes],
				free_bikes: availability[:free_bikes],
				name: availability[:name],
				uid: availability[:id]
			)
		end
	end
end
