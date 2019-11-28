Rails.application.routes.draw do
  root 'blogs#index'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'

  devise_for :users
  resources :users, only: [:index,:show] do
    member do
      get :phrases
      get :nices
      get :follow
      get :follower
    end
  end
  resources :blogs
  resources :nices, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
