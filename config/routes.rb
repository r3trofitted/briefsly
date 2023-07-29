Rails.application.routes.draw do
  get 'sessions/new'
  get "auth/github/callback", to: 'oauth_callbacks#github'

  root to: 'sessions#new'
end
