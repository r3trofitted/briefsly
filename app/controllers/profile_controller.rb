class ProfileController < ApplicationController
  def edit
    @user = user
  end
  
  def update
  end

  private

  def user
    @_user ||= Octokit.user(Current.user.github_nickname)
  end

end
