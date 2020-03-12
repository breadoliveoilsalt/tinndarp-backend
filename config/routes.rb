Rails.application.routes.draw do

  root "home#main"

  namespace :api do
    post "sign_up", to: "users#create"
    post "log_in", to: "sessions#create"
    resources :items, only: [:index, :show]
  end

end
