Rails.application.routes.draw do
  resources :searches
  resources :wishlists
   get 'add_product' => 'wishlists#add_product', as: :add_product
   get 'remove_product' => 'wishlists#remove_product', as: :remove_product
  # get '/wishlist/add_product' => 'wishlist#add_product'
  resources :categories
  resources :specific_notifications
  
  root "static_page#home"
  get 'carts/index'
  devise_for :users
  resources :orders do 
    collection do 
      get 'time_slot'
    end
  end 
  get "admin_orders", to: "orders#adminorder" 
  resources :products do
    resources :orders, module: :products
  end
  post "products/soft_destroy", to: "products#soft_destroy"
  resources :product_variants do
    resources :orders, module: :product_variants
  end
  post "product_variants/soft_destroy", to: "product_variants#soft_destroy"
  resources :product_services do 
    resources :orders, module: :product_services
  end  
  post "product_services/soft_destroy", to: "product_services#soft_destroy"
   post 'carts/update_qty'
   get 'carts/pay_now'
   post 'carts/update_time'
   
  resources :users
  post "checkout/create", to: "checkout#create"
  get "checkout/order_place", to: "checkout#order_place"
  
  resources :notifications


end
