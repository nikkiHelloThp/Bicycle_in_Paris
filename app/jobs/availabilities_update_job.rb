class AvailabilitiesUpdateJob < ApplicationJob
	self.queue_adapter = :sidekiq
  queue_as :default

  def perform(*args)
	response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
	@response = JSON.parse response, symbolize_names: true
	@response = @response[:network][:stations]
		
		@response.each do |patch|
			@availability = Availability.find_by(uid: patch[:id])
			next unless @availability.empty_slot != patch[:empty_slots]
				@availability.update(
					empty_slot: patch[:empty_slots],
					has_bikes: patch[:has_bikes],
					free_bikes: patch[:free_bikes]
				)
			end
		end
  end
end
