# frozen_string_literal: true

class Location < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lon
  after_validation :geocode, if: :address_changed?
end
