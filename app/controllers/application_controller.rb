class ApplicationController < ActionController::Base
  include Authentication
  
  before_action :set_variant
  
  private
  
  def set_variant
    request.variant = :embed if request.headers.include?("X-Embed-In")
  end
end
