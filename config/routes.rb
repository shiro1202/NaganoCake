Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    devise_for :end_users
    get 'end_users' => 'end_users#show'
    patch 'end_users' => 'end_users#update'
    get 'end_users/edit' => 'end_users#edit'
    get 'end_users/confirm' => 'end_users#confirm'
    patch 'end_users/withdraw' => 'end_users#withdraw'
  end

  scope module: :admin do
    devise_for :admins
    get 'admins' => 'homes#top'
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
