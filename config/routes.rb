Rails.application.routes.draw do
  devise_for :restaurants
  devise_for :admins
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }


  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
