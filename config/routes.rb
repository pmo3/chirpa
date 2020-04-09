# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", :as => "rails_admin"
  resources :chirps, only: %i[index new create] do
    resources :chirp_requests, path: "requests"
  end
  resources :exclusions, only: %i[new create], path: "unsubscribe"
  get "/unsubscribe/success", to: "exclusions#success", as: :exclusions_success
  devise_for :admins, skip: [:registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
