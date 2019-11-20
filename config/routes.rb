Rails.application.routes.draw do
  get 'users/show'


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
  root 'blogs#index'
  resources :blogs
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
