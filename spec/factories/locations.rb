# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    address { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
