Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  root 'blogs#top'


  # ログイン、アカウント編集後、任意のページに推移させるための記述
  # devise_for :users, controllers: {
  #         registrations: 'users/registrations',
  #         sessions: 'users/sessions'
  # }

  devise_for :users
  resources :users, only: [:index,:show] do
    member do
      get :phrases
      get :nices
      get :follow
      get :follower
    end
  end
  resources :blogs do
    collection do
      get :top
    end
  end
  resources :nices, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
