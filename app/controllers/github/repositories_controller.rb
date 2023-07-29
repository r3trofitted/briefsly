class Github::RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @repositories = github_client.repos
  end

  private

  def github_client
    Github::Client.new(access_token: current_user.github_access_token)
  end
end
