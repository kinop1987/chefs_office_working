Rails.application.routes.draw do
  devise_for :orders, controllers: {
    sessions: 'orders/sessions',
    passwords: 'orders/passwords',
    registrations: 'orders/registrations'
  }
  devise_for :suppliers, controllers: {
    sessions: 'suppliers/sessions',
    passwords: 'suppliers/passwords',
    registrations: 'suppliers/registrations'
  }
  root to: 'home#index'
  get 'home/calculation', to: 'home#calculation', as: :calculation
  get 'home/calendar', to: 'home#calendar', as: :calendar
  get 'home/suppliers', to: 'home#suppliers', as: :list_suppliers
  get 'home/orders', to: 'home#orders', as: :list_orders

  resources :memos

  resources :products

  resources :cookings do
    collection do
      get 'search'
    end
  end

  resources :inventories, only: %i[index edit create update] do
    member do
      get 'new', to: 'inventories#new', as: :new
    end
    collection do
      get 'search'
    end
  end

  resources :contracts, only: %i[index show] do 
    member do
      get 'new'
      post 'create'
      post 'confirm'
    end
    collection do
      get 'suppliers_contract'
      get 'check'
      get 'group/:delivery_date'
    end
  end


  get 'vouchers/:contract_id/new', to: 'vouchers#new', as: :new_voucher
  post 'vouchers/:contract_id', to: 'vouchers#create', as: :create_voucher
  post 'vouchers/:contract_id/confirm', to: 'vouchers#confirm', as: :confirm_voucher
  get 'vouchers/group/:delivery_date', to: 'vouchers#group', as: :group_voucher
  get 'vouchers/orders_voucher', to: 'vouchers#orders_voucher', as: :orders_voucher
  get 'vouchers/suppliers_voucher', to: 'vouchers#suppliers_voucher', as: :suppliers_voucher
  get 'vouchers/:voucher_id/edit', to: 'vouchers#edit', as: :edit_voucher
  get 'vouchers/receipt', to: 'vouchers#receipt', as: :receipt_voucher
  post 'vouchers/:voucher_id/show', to: 'vouchers#show', as: :show_receipt
  post 'vouchers/:voucher_id/update', to: 'vouchers#update', as: :update_voucher
  get 'vouchers/aggregation', to: 'vouchers#aggregation', as: :aggregation
  get 'vouchers/search', to: 'vouchers#search', as: :search_vouchers
end
