Rails.application.routes.draw do
  namespace :restaurant do
    get 'promotions/promotion'
  end
  namespace :restaurant do
    get 'coupons/index'
    get 'coupons/show'
  end
  namespace :restaurant do
    get 'comments/index'
    get 'comments/edit'
  end
  namespace :restaurant do
    get 'owners/edit'
    get 'owners/unsubscribe'
  end
  namespace :restaurant do
    get 'homes/top'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'reviews/index'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'restaurants/show'
    get 'restaurants/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/edit'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/new'
    get 'reviews/edit'
  end
  namespace :public do
    get 'searches/search'
  end
  namespace :public do
    get 'restaurants/index'
    get 'restaurants/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
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


  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
