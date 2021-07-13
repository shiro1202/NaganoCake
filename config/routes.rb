Rails.application.routes.draw do
  scope module: :admin do
    devise_for :admins
    get 'admins' => 'homes#top'
    get 'admins/end_users' => 'end_users#index'
    get 'admins/endusers/:id' => 'end_users#show'
    get 'admin/items' => 'items#index'
    get 'admin/items/new' => 'items#new'
    post 'admin/items' => 'items#create'
    get 'admin/items/:id' => 'items#show'
    get 'admin/items/:id/edit' => 'items#edit'
    patch 'admin/items/:id' => 'items#update'
    get 'admin/genres' => 'genres#index'
    post 'admin/genres' => 'genres#create'
    get 'admin/genres/:id/edit' => 'genres#edit'
    patch 'admin/genres/:id' => 'genres#update'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
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
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
