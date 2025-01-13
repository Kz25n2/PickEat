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


  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
