class Slot < ApplicationRecord
  belongs_to :user

  validates :start_at, :end_at, :repository, :issue_number, presence: true

  scope :by_repository, ->(repository) { where(repository: repository) }
  scope :by_issue, ->(issue_number) { where(issue_number: issue_number) }
end
