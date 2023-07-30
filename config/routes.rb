Rails.application.routes.draw do
  resource :session, only: [:new, :destroy]

  get "auth/github/callback", to: 'oauth_callbacks#github'

  resources :repositories, only: [:index, :show], param: :name do
    resources :issues, only: [:index, :show]
  end

  resources :slots, only: [:index, :new, :create] do
    resources :jams, only: [:new, :create]
  end

  scope "/my" do
    resource :schedule, only: :show, controller: "schedule"
    resource :profile, only: [:edit, :update], controller: "profile"
  end

  root to: 'sessions#new'
end
