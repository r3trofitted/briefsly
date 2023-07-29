class SessionsController < ApplicationController
  skip_authentication! only: :new
  
  def new
  end
  
  def destroy
    session.delete :user_id
    Current.user = nil
    
    redirect_to root_url, status: :see_other
  end
end
