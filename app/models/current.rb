class Current < ActiveSupport::CurrentAttributes
  attribute :user, :github_client
  
  def user=(user)
    super
    
    self.github_client = Octokit::Client.new bearer_token: user.github_access_token, per_page: 20
  end
end
