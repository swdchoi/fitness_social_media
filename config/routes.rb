Rails.application.routes.draw do
  authenticated :user do
    root to: "home#main", as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end

  devise_for :users

  resources :programs do
    resources :workouts do
      resources :exercises
    end
  end

  resources :sessions do
    resources :movements
  end

  resources :friends, only: [ :create, :index, :update, :destroy ]

  root to: "home#index"

  get "profile", to: "home#profile", as: "profile"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
