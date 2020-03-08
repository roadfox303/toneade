# frozen_string_literal: true

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
  resources :users, only: %i[index show] do
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
      get :manual
    end
  end
  resources :nices, only: %i[create destroy]
  resources :comments, only: %i[create edit update destroy]
  resources :relationships, only: %i[create destroy]
  resources :packages, only: %i[index create destroy] do
    collection do
      get :success
    end
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
