class IssuesController < ApplicationController

  def index
    @issues = github_client.issues(repository_name, sort: { updated: :desc })
  end

  private

  def repository_name
    params[:repository_name]
  end

  def github_client
    Octokit::Client.new(per_page: 20)
  end

end
