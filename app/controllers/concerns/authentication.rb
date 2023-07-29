module Authentication
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate
    
    def self.skip_authentication!(**opts)
      logger.debug "skipped auth"
      skip_before_action :authenticate, **opts
    end
  end
  
  private
  
  def authenticate
    if user = User.find_by(id: session[:user_id])
      Current.user = user
    else
      redirect_to new_session_path, notice: "You must sign in to access this page."
    end
  end
end