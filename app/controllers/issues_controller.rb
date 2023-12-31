class IssuesController < ApplicationController

  def index
    @issues = github_client.issues(repository_name, sort: { updated: :desc }, per_page: 12)
    
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @issue = github_client.issue(repository_name, params[:id])
    @slot = Slot.new(repository: repository_name, issue_number: params[:id])
  end

  private

  def repository_name
    params[:repository_name]
  end

  def github_client
    Current.github_client
  end
end
