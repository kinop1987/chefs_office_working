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
end
