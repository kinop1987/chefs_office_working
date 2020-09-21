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
      get 'search', to:'inventories#search'
    end
  end

  resources :contracts, only: %i[index show] do
    member do 
      get 'new', to: 'contracts#new', as: :new
      post '',    to: 'contracts#create'
      post 'confirm', to: 'contracts#confirm'
    end
    collection do
      get 'suppliers_contract', to: 'contracts#suppliers_contract', as: :suppliers
      get 'check', to: 'contracts#check'
      get 'group/:delivery_date', to: 'contracts#group', as: :group
    end
  end

  resources :vouchers, only: %i[index show edit update] do
    member do 
      get 'new', to: 'vouchers#new', as: :new
      post '',    to: 'vouchers#create'
      post 'confirm', to: 'vouchers#confirm'
    end
    collection do
      get 'search', to: 'vouchers#search'
      get 'orders_voucher', to: 'vouchers#orders_voucher', as: :orders
      get 'suppliers_voucher', to: 'vouchers#suppliers_voucher', as: :suppliers
      get 'group/:delivery_date', to: 'contracts#group', as: :group
      get 'receipt', to: 'vouchers#receipt'
      get 'aggregation', to: 'vouchers#aggregation' 
    end
  end

end
