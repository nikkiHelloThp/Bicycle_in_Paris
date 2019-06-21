class AvailabilitiesUpdateJob < ApplicationJob
  self.queue_adapter = :sidekiq
  queue_as :default

  def perform(*args)
	response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
	@response = JSON.parse response, symbolize_names: true
	@response = @response[:network][:stations]
		
		@response.each do |params|
			@availability = Availability.find_by(uid: params[:id])
			if @availability.empty_slot != params[:empty_slots]
				@availability.update(
					free_bikes: params[:free_bikes],
					empty_slot: params[:empty_slots]
					)
				if @availability.save
					p 'updated'
				else
					p 'No update needed'
				end		
			end
		end
  end
end
