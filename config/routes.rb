Rails.application.routes.draw do

  devise_for :restaurants, controllers: {
    registrations: "restaurant/registrations",
    sessions: "restaurant/sessions",
    passwords: "restaurant/passwords"
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }

  namespace :restaurant do
    resources :promotions, only: [:new, :create]
    resources :coupons, only: [:index, :show, :create, :update, :destroy]
    resources :comments, only: [:index, :edit, :create, :update, :destroy]
    resources :owners, only: [:edit, :update] do
      patch 'restaurants/withdrawal'
      get 'restaurants/unsubscribe'
    end
    get '/' => 'homes#top'
  end
  
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :restaurants, only: [:show, :edit, :update, :destroy]
    get '/' => 'homes#top'
  end

  scope module: :public do
    get 'comments/index'
    get 'comments/edit'
    resources :reviews, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:index, :edit, :create, :update, :destroy]
    end
    resources :restaurants, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      patch 'customers/withdrawal'
      get 'customers/unsubscribe'
    end
    get 'searches/search'
  end
  
  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
