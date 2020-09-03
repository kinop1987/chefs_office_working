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
  resources :orders do 
    get "contracts/new/:supplier_id", to: "contracts#new"
    post "contracts/:supplier_id", to: "contracts#create" 
    post "contracts/:supplier_id/confirm", to: "contracts#confirm"
    get "contracts/:contract_id",to: "contracts#show"
    get "contracts/group/:delivery_date", to: "contracts#group"
    get "contracts", to: "contracts#index"
  end
  resources :suppliers do
    get "vouchers/:order_id/new", to: "vouchers#new"
    post "vouchers/:order_id", to: "vouchers#create"
    post "vouchers/:order_id/confirm", to:"vouchers#confirm"
    get "vouchers/:voucher_id", to: "vouchers#show"
    get "vouchers/group/:delivery_date", to: "vouchers#group"
    get "vouchers", to: "vouchers#index"
    get "vouchers/:voucher_id/edit", to: "vouchers#edit"
  end

end
