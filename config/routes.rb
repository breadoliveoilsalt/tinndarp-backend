Rails.application.routes.draw do

  root "home#main"

  namespace :api do
    get "sign_up", to: "users#test"
    post "sign_up", to: "users#create"
    resources :items, only: [:index, :show]
  end

end
