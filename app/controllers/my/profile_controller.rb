class My::ProfileController < ApplicationController
  def edit
    @user = Current.user
  end
  
  def update
  end
end
