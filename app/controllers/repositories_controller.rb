class RepositoriesController < ApplicationController
  def index
    q = params[:terms].presence || "rails"
    
    @repositories = Current.github_client.search_repositories(q).items
  end
end
