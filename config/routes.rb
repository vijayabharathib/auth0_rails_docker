Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/dashboard" => "dashboard#show"
  root "home#show"
  resources :books
  resources :publishers
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
