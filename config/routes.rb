Rails.application.routes.draw do
  root :to => "consultants#index"
  resources :coffee_chats
  resources :companies
  resources :consultants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
