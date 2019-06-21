# frozen_string_literal: true

Rails.application.routes.draw do
  resources :locations, only: [:index]
	root :to => "locations#index" # create availabilities: "availabilities#index"
	resources :availabilities, only: [:index]
end
