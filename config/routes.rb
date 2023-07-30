Rails.application.routes.draw do
  root to: "pages#home"

  resource :session, only: [:new, :destroy]

  get "auth/github/callback", to: 'oauth_callbacks#github'

  resources :repositories, only: [:index, :show], param: :name do
    resources :issues, only: [:index, :show]
  end

  resources :slots, only: [:index, :new, :create] do
    resources :jams, only: [:new, :create], shallow: true do
      member do
        post "accept"
        post "decline"
      end
    end
  end

  scope "/my" do
    resource :schedule, only: :show, controller: "schedule"
    resource :profile, only: [:edit, :update], controller: "profile"
  end
end
