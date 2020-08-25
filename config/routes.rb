Rails.application.routes.draw do
  devise_for :suppliers
  devise_for :orders
  root to: 'home#index'
end
