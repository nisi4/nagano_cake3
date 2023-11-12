Rails.application.routes.draw do
  root to: "public/homes#top"
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    post "genres" => "genres#create"
    get 'genres/:id/edit' => "genres#edit",as: "edit_genre"
    patch "genres/:id" => "genres#update",as: "update_genre"
  end
  namespace :admin do
    get 'items/new'
    post "items" => "items#create"
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/about'
  end
  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
