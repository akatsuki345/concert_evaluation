Rails.application.routes.draw do

  namespace :admin do
    root to: "home#top"
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :tags, only: [:index, :show, :destroy]
    resources :concerts, only: [:index, :show, :destroy, :new, :create, :confirm, :complete, :edit, :update] do
     resources :revues, only: [:index, :show, :destroy]
      resources :comments, only: [:index, :show, :destroy]
    end

    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
  end

  root to: "public/home#top"

  namespace :public do
    get "/home/public/about" => "home#about", as: "about"
    resources :concerts, only: [:index, :show] do
     resources :revues, only: [:index, :edit, :create, :update, :destroy]
      resources :comments, only: [:index, :edit, :create, :update, :destroy]
    end
    get "search" => "searches#search"
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/comfirm" => "orders#comfirm", as: "comfirm"
    get "orders/complete" => "orders#complete",as: "complete"
    delete "cart_items/destroy_all", to: "cart_items#destroy_all", as: "destroy_all"
    # patch "cart_items/update/:id", to: "cart_items#update", as: "update_cart_item"
    resources :cart_items, only: [:index, :destroy, :update, :create]
    resources :tags, only: [:index, :show, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
        patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      end
    end

    resources :addresses, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'public/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end