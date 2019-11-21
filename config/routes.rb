Rails.application.routes.draw do
  get 'users/show'
  root 'blogs#index'


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
      get :followed
      get :follower
    end
  end
  resources :blogs
  resources :nices, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
