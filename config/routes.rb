Rails.application.routes.draw do

  root "home#main"

  namespace :api do
    post "sign_up", to: "users#create"
    post "log_in", to: "sessions#create"
    resources :items, only: [:index, :show]
    get "authenticate_user_token", to: "users#authenticate_user_token"
    get "browsing", to: "browsing#browse"
  end

end
