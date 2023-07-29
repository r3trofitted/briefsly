class RepositoriesController < ApplicationController
  def index
    @repositories = github_client.search_repositories("language:ruby").items
  end

  private

  def github_client
    Octokit::Client.new(per_page: 20)
  end
end
