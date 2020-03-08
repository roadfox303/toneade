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

  post '/webhook' do
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      # Then define and call a method to handle the successful payment intent.
      # handle_payment_intent_succeeded(payment_intent)
    when 'payment_method.attached'
      payment_method = event.data.object # contains a Stripe::PaymentMethod
      # Then define and call a method to handle the successful attachment of a PaymentMethod.
      # handle_payment_method_attached(payment_method)
    # ... handle other event types
    else
      # Unexpected event type
      status 400
      return
    end

    status 200
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
