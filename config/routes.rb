Rails.application.routes.draw do
  mount Bitbot.listener, at: 'foodit-webhook', via: :post

  resources :restaurants
end
