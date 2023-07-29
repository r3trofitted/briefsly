# Maps the data from the Github API to a Ruby object containing only
# the data we need.

class Github::Repository
  def self.from(data)
    new(full_name: data["full_name"])
  end

  attr_reader :full_name

  def initialize(full_name:)
    @full_name = full_name
  end
end
