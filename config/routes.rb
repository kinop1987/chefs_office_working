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
  
  get "contracts/:supplier_id/new", to: "contracts#new", as: :new_contract
  post "contracts/:supplier_id", to: "contracts#create" , as: :create_contract
  post "contracts/:supplier_id/confirm", to: "contracts#confirm", as: :confirm_contract
  get "contracts/suppliers_contract", to: "contracts#suppliers_contract", as: :suppliers_contract
  get "contracts/check", to: "contracts#check", as: :check_contract
  get "contracts/:contract_id",to: "contracts#show", as: :show_contract
  get "contracts/group/:delivery_date", to: "contracts#group", as: :group_contract
  get "contracts", to: "contracts#index"
  
  
  get "vouchers/:contract_id/new", to: "vouchers#new", as: :new_voucher
  post "vouchers/:contract_id", to: "vouchers#create", as: :create_voucher
  post "vouchers/:contract_id/confirm", to:"vouchers#confirm", as: :confirm_voucher
  get "vouchers/group/:delivery_date", to: "vouchers#group", as: :group_voucher
  get "vouchers/orders_voucher", to: "vouchers#orders_voucher", as: :orders_voucher
  get "vouchers/suppliers_voucher", to: "vouchers#suppliers_voucher", as: :suppliers_voucher
  get "vouchers/:voucher_id/edit", to: "vouchers#edit", as: :edit_voucher
  get "vouchers/receipt", to: "vouchers#receipt", as: :receipt_voucher
  post "vouchers/:voucher_id/show", to: "vouchers#show", as: :show_receipt
  post "vouchers/:voucher_id/update", to: "vouchers#update", as: :update_voucher

end
