Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  get '/algorithms/run_code', to: 'algorithms#run_code', as: 'run_code'

  resources :welcome, only: [:index]
  resources :secrets, only: [:create, :show]
  resources :algorithms, only: [:show]
  resources :messages, only: [:new, :create, :show]
  resources :templates, only:[:index, :show]
  resources :users, only: [:index, :show] do
    member do
      get 'received_messages'
      get 'requested_friendships'
    end
  end

  resources :friendships, only: [:create, :update, :destroy, :index]

  # Example resource route with options:
  #     collection do
  #       get 'sold'
  #     end
  #   end
end
