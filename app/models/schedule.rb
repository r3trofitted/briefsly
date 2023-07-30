class Schedule
  attr_reader :user
  delegate :slots, :hosting_jams, :guesting_jams, to: :user
  
  def initialize(user)
    @user = user
  end
  
  def empty?
    slots.none? && jams.none?
  end
  
  def jams
    hosting_jams.to_a.concat guesting_jams
  end
end
