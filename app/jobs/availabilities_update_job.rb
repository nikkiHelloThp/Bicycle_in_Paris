# frozen_string_literal: true

require 'sidekiq-scheduler'
class AvailabilitiesUpdateJob < ApplicationJob
  self.queue_adapter = :sidekiq
  queue_as :default

  def perform(*_args)
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    response_parsed = JSON.parse response, symbolize_names: true
    stations = response_parsed[:network][:stations]

    stations.each do |params|
      availability = Availability.find_by(uid: params[:extra][:uid])
      if availability && availability.empty_slot != params[:empty_slots]
        availability.update(
          free_bikes: params[:free_bikes],
          empty_slot: params[:empty_slots]
        )
        p 'updated'
      else
        p 'No update needed'
      end
    end
  end
end
