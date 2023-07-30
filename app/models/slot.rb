class Slot < ApplicationRecord
  belongs_to :user

  # TODO: has_many
  has_one :jam

  validates :start_at, :end_at, :repository, :issue_number, presence: true

  scope :by_repository, ->(repository) { where(repository: repository) }
  scope :by_issue, ->(issue_number) { where(issue_number: issue_number) }

  def project_name
    "%s #%d" % [repository, issue_number]
  end

  def buddy_name
    "%s (%s)" % [user.name, user.github_nickname]
  end

  def time_slot
    "xxx"
  end
end
