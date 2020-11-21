Rails.application.routes.draw do
  devise_for :users

  #   devise_for :users, :controllers => {
  #     :registrations => 'users/registrations',
  #     :sessions => 'users/sessions'
  #   }
  #   devise_scope :user do
  #     get "sign_in", :to => "users/sessions#new"
  #     get "sign_out", :to => "users/sessions#destroy"
  #   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'time_cards#new'
  resources :time_cards
  
  namespace :admin do
    resources :time_cards
  end

  resources :requests
  namespace :admin do
    resources :requests
  end

  resources :users
  namespace :admin do
    resources :users
  end

  resources :salaries
  namespace :admin do
    resources :salaries
  end
end
