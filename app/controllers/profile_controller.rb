class ProfileController < ApplicationController
  def edit
    @user = user
  end
  
  def update
    if Current.user.update(experience_level: experience_level)
      redirect_to edit_profile_path
    else
      flash[:alert] = "Something went wrong."
      @user = user
      render :edit
    end
  end

  private

  def experience_level
    params[:user][:experience_level].to_i
  end

  def user
    @_user ||= Octokit.user(Current.user.github_nickname)
  end

end
