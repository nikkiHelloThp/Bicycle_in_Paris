class HomeController < ApplicationController
	def index
		@availabilities = Availability.all
		@latitude = 48.8721312
		@longitude = 2.3466598
		@address = @availabilities.near(latitude: @latitude, longitude: @longitude)
		@thp = Availability.near('9 rue Bergère, Paris 75002, France')
		@thpaddress = Geocoder.search('9 rue Bergère, Paris 75002, France')
		@thpaddress.first.coordinates
		@closeststations = Availability.near([48.8721312, 2.3466598], 1).take(5)
	end
end
