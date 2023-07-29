class OAuthCallbacksController < ApplicationController
  def github
    user = User.from_omniauth request.env['omniauth.auth']
    
    if user.persisted?
      session[:user_id] = user.id
      
      redirect_to root_url
    else
      # TODO – handle error
    end
  end
end