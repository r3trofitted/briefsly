Rails.application.routes.draw do
  resource :session, only: [:new, :destroy]

  get "auth/github/callback", to: 'oauth_callbacks#github'

  resources :repositories, only: [:index, :show], param: :name do
    resources :issues, only: [:index, :show]
  end

  resources :slots, only: [:index, :create] do
    resources :jams, only: [:new, :create]
  end

  namespace :my do
    resource :schedule, only: :show
    resource :profile, only: [:edit, :update]
  end
  

  root to: 'my/schedules#show'
end
