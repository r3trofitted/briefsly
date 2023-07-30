module Authentication
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate
    
    def self.skip_authentication!(**opts)
      skip_before_action :authenticate, **opts
    end
  end
  
  private
  
  def authenticate
    if auth_token = request.headers["X-Briefsly-Auth"]
      user = User.find_by(ext_auth_token: auth_token)
    else 
      user = User.find_by(id: session[:user_id])
    end
    
    if user
      Current.user = user
    else
      redirect_to new_session_path, notice: "You must sign in to access this page."
    end
  end
end
