class Jam < ApplicationRecord
  belongs_to :slot
  belongs_to :guest, class_name: "User"
  
  enum :status, [:suggested, :accepted, :declined], default: :suggested

  before_validation :set_start_at, :set_end_at
  
  delegate :project_name, to: :slot

  private

  def set_start_at
    self.start_at ||= slot.start_at
  end

  def set_end_at
    self.end_at ||= slot.end_at
  end
end
