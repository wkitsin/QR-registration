Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#new"
  # get '/user/:email', to: 'users#show', as: 'user', key: :email
  get "/user/:email" => "users#show",
    :constraints => { :email => /.+@.+\..*/ }, as: 'user'

  resources :users, only: [:new, :create, :index]
  resources :users_registration_status, only: [:update]
  resources :mailer, only: [:create]
end
