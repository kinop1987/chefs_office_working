Rails.application.routes.draw do
  devise_for :orders, controllers: {
    sessions:      'orders/sessions',
    passwords:     'orders/passwords',
    registrations: 'orders/registrations'
  }
  devise_for :suppliers, controllers: {
    sessions:      'suppliers/sessions',
    passwords:     'suppliers/passwords',
    registrations: 'suppliers/registrations'
  }
  root to: 'home#index'

  resources :memos 
  resources :products
  get "contracts/new/:supplier_id", to: "contracts#new"
  post "cotracts/:supplier_id", to: "contracts#create" 
  post "contracts:supplier_id/confirm", to: "contracts#confirm"
  get "contracts/:contract_id/show",to: "contracts#show"
  get "contracts/group/:delivery_date", to: "contracts#group"
end
