# see https://github.com/octokit/octokit.rb#debugging

require 'faraday'
require 'faraday/retry'

stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::Retry::Middleware, exceptions: Faraday::Retry::Middleware::DEFAULT_EXCEPTIONS + [Octokit::ServerError] # or Faraday::Request::Retry for Faraday < 2.0
  builder.use Octokit::Middleware::FollowRedirects
  builder.use Octokit::Response::RaiseError
  builder.use Octokit::Response::FeedParser
  builder.response :logger do |logger|
    logger.filter(/(Authorization: "(token|Bearer) )(\w+)/, '\1[REMOVED]')
  end
  builder.adapter Faraday.default_adapter
end

Octokit.middleware = stack
