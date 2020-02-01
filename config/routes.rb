# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "locations#index"
  resources :availabilities, only: [:index]
end
