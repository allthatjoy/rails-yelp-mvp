Rails.application.routes.draw do
  get 'restaurants/new'
  resources :restaurants
end
