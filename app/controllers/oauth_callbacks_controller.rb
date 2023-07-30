class OAuthCallbacksController < ApplicationController
  skip_authentication!
  
  def github
    user = User.from_omniauth request.env['omniauth.auth']
    
    if user.persisted?
      session[:user_id] = user.id
      
      redirect_to schedule_url
    else
      # TODO – handle error
    end
  end
end
