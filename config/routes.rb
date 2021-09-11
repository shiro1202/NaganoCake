Rails.application.routes.draw do
  scope module: :admin do
    devise_for :admins
    get 'admins' => 'homes#top'
    get 'admins/end_users' => 'end_users#index'
    get 'admins/endusers/:id' => 'end_users#show'
    resources :items, path: '/admin/items', :except => :destroy
    get 'admin/genres' => 'genres#index'
    post 'admin/genres' => 'genres#create'
    get 'admin/genres/:id/edit' => 'genres#edit', as: :admin_genres_edit
    patch 'admin/genres/:id' => 'genres#update', as: :admin_genre
    get 'admin/orders/:id' => 'orders#show', as: :admin_order
    patch 'admin/orders/:id' => 'orders#update'
    patch 'admin/order_details/:id' => 'order_details#update', as: :admin_order_detail
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'items' => 'items#index', as: :public_items
    get 'items/:id' => 'items#show', as: :public_item
    get 'cart_items' => 'cart_items#index', as: :cart_items
    patch 'cart_items/:id' => 'cart_items#update', as: :cart_item
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy'
    post 'cart_items' => 'cart_items#create'
    devise_for :end_users, skip: [:registrations]
    as :end_user do
      get 'end_users/sign_up', to: 'registrations#new', as: :new_end_user_registration
      post 'end_users/sign_up', to: 'registrations#create', as: :end_user_registration
    end
    get 'end_users' => 'end_users#show'
    patch 'end_users' => 'end_users#update'
    get 'end_users/edit' => 'end_users#edit'
    get 'end_users/confirm' => 'end_users#confirm'
    patch 'end_users/withdraw' => 'end_users#withdraw'
    get 'orders/new' => 'orders#new'
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    post 'orders' => 'orders#create'
    get 'orders' => 'orders#index'
    get 'orders/:id' => 'orders#show', as: :order
    resources :addresses, :except => :new
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
