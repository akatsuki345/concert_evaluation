Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :comments, only: [:index, :show, :destroy]
    resources :revues, only: [:index, :show, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :concerts, only: [:index, :show, :destroy]
    resources :categories, only: [:index, :create, :edit, :update]
  end

  namespace :public do
    resources :revues, only: [:index, :edit, :create, :update, :destroy]
    resources :comments, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  namespace :public do
    get 'concerts/index'
    get 'concerts/show'
    get 'concerts/new'
    get 'concerts/create'
    get 'concerts/confirm'
    get 'concerts/complete'
    get 'concerts/edit'
    get 'concerts/update'
  end
  namespace :public do
    get 'home/top'
    get 'home/about'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
