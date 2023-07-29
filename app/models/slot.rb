class Slot < ApplicationRecord
  belongs_to :user

  validates :start_at, :end_at, :repository, :issue_number, presence: true
  
end
