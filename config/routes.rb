Rails.application.routes.draw do
  root to: 'sessions#new'

  get "auth/github/callback", to: 'oauth_callbacks#github'

  resources :repositories, only: [:index, :show], param: :name do
    resources :issues, only: [:index, :show]
  end
end
