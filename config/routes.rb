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
    resources :promotions, only: [:create] do
      collection do
        get :promotion
      end
    end
    resources :coupons, only: [:index, :show, :create, :update, :destroy]
    resources :comments, only: [:index, :edit, :create, :update, :destroy]
    resources :owners, only: [:edit, :update] do
      member do
        patch :withdrawal
      end
      collection do
        get :unsubscribe
      end
    end
    get '/top' => 'homes#top'
  end
  
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :customers, only: [:index, :edit, :update, :destroy]
    resources :restaurants, only: [:show, :edit, :update, :destroy]
    get '/top' => 'homes#top'
  end

  scope module: :public do
    resources :promotions, only: [:index]
    resources :restaurants, only: [:index, :show] do
      resources :reviews, only: [:index, :new, :edit, :create, :update, :destroy]
    end
    resources :comments, only: [:index, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      patch 'customers/withdrawal'
      get 'customers/unsubscribe'
    end
    get 'genre_search', to: 'searches#genre_search', as: 'genre_search'
    get 'keyword_search', to: 'searches#keyword_search', as: 'keyword_search'
  end
  
  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
