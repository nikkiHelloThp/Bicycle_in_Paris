class HomeController < ApplicationController
	def index
		@availabilities = Availability.all
		@thpaddress = Geocoder.search('9 rue Bergère, Paris 75002, France')
		@thp = @thpaddress.first.coordinates
		@closeststations = Availability.near(@thp, 1).take(5)
	end
end
