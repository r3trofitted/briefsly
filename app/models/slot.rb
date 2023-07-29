class Slot < ApplicationRecord
  belongs_to :user

  # TODO: has_many
  has_one :jam

  validates :start_at, :end_at, :repository, :issue_number, presence: true

  scope :by_repository, ->(repository) { where(repository: repository) }
  scope :by_issue, ->(issue_number) { where(issue_number: issue_number) }

  def self.search(params)
    slots = self.includes(:user).all

    slots = slots.by_repository(params[:repository_name]) if params.has_key?(:repository_name)
    slots = slots.by_issue(params[:issue_number]) if params.has_key?(:issue_number)
    slots = slots.references(:user).merge(User.by_buddyname(params[:buddy_name])) if params.has_key?(:buddy_name)

    slots
  end

  def project_name
    repository # SLIME
  end

  def buddy_name
    "%s (%s)" % [user.name, user.github_nickname]
  end

  def time_slot
    "xxx"
  end
end
