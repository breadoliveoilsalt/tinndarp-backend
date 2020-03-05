Rails.application.routes.draw do
  
  root "home#main"

  resources :items, only: [:index, :show]

  namespace :api do
    get "sign_up", to: "users#test"
    post "sign_up", to: "users#create"
  end

end
