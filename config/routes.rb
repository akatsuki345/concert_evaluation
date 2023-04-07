Rails.application.routes.draw do

  namespace :public do
    get 'revues/index'
    get 'revues/edit'
    get 'revues/create'
    get 'revues/update'
    get 'revues/destroy'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/edit'
    get 'comments/create'
    get 'comments/update'
    get 'comments/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
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
