Rails.application.routes.draw do
  get 'sessions/new'
  get "auth/github/callback", to: 'oauth_callbacks#github'

  root to: 'sessions#new'

  resources :repositories, only: [:index, :show], param: :name do
    resources :issues, only: [:index]
  end
end
