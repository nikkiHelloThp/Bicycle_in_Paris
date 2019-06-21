# frozen_string_literal: true

Rails.application.routes.draw do
	root :to => "home#index" # create availabilities: "availabilities#index"
	resources :availabilities, only: [:index]
end
