class Schedule
  attr_reader :user
  delegate :slots, :hosting_jams, :guesting_jams, to: :user
  
  def initialize(user)
    @user = user
  end
  
  def empty?
    slots.none? && hosting_jams.none? && guesting_jams.none?
  end
end
