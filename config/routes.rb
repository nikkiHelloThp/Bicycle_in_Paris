# frozen_string_literal: true

Rails.application.routes.draw do
	root :to => "home#index"
	resources :availabilities, only: [:index]
end
