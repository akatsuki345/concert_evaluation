Rails.application.routes.draw do

  namespace :admin do
    root to: "home#top"
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :concerts, only: [:index, :show, :destroy] do
     resources :revues, only: [:index, :show, :destroy]
      resources :comments, only: [:index, :show, :destroy]
    end
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
  end

  root to: "public/home#top"

  namespace :public do
    get "/home/public/about" => "home#about", as: "about"
    resources :concerts, only: [:index, :show, :new, :create, :confirm, :complete, :edit, :update] do
     resources :revues, only: [:index, :edit, :create, :update, :destroy]
      resources :comments, only: [:index, :edit, :create, :update, :destroy]
    end
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :addresses, only: [:index, :new, :edit, :create, :update, :destroy]
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
