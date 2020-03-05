Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#main"

  resources :items, only: [:index, :show]

  namespace :api do
    get "sign_up", to: "users#test"
    post "sign_up", to: "users#create"
  end

    # post "sign_up", to: "users#create"
end
