class ApplicationController < ActionController::Base
  def authenticate_user!
    unless user_signed_in?
      redirect_to sessions_new_path, notice: "You must sign in to access this page."
    end
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end
end
