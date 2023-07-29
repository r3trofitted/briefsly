class RepositoriesController < ApplicationController
  def index
    @repositories = github_client.search_repositories(terms).items
  end

  private

  def github_client
    Octokit::Client.new(per_page: 20)
  end

  def terms
    @terms = params[:terms].presence || "rails"
  end
end
