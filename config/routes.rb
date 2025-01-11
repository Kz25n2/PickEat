Rails.application.routes.draw do
  devise_for :restaurants
  devise_for :admins
  devise_for :customers
  get 'homes/top'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
