class Jam < ApplicationRecord
  belongs_to :slot
  belongs_to :guest, class_name: "User"

  before_validation :set_start_at, :set_end_at

  private

  def set_start_at
    self.start_at ||= slot.start_at
  end

  def set_end_at
    self.end_at ||= slot.end_at
  end
end
