# Wrapper around Octokit::Client in order to expose our own objects
# rather that Octokit's raw data.

class Github::Client
  def initialize(access_token:)
    @client = Octokit::Client.new(access_token: access_token)
  end

  def repos
    client.repos.map { |data| Github::Repository.from(data) }
  end

  private

  attr_reader :client
end
