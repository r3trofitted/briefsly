class SlotSearch
  extend ActiveModel::Naming
  
  def initialize(params)
    @params = params.compact_blank
  end
  
  def buddy_name
    @params[:buddy_name]
  end
  
  def issue_number
    @params[:issue_number]
  end
  
  def repository_name
    @params[:repository_name]
  end
  
  def relative_experience
    @params[:relative_experience]
  end
  
  def slots
    slots = Slot.includes(:user).where.not(user: Current.user)

    slots = slots.by_repository(repository_name) if repository_name.present?
    slots = slots.by_issue(issue_number) if issue_number.present?
    slots = slots.references(:user).merge(User.by_buddyname(buddy_name)) if buddy_name.present?
    slots = slots.references(:user).merge(User.where(experience_level: required_xp_levels))

    slots.limit(48)
    
    slots
  end
  
  private
  
  def required_xp_levels
    return User.experience_levels.keys if Current.user.experience_level.blank?
    
    case relative_experience.to_s.to_sym
    when :less_experienced
      User.experience_levels.select { |_, v| v < User.experience_levels[Current.user.experience_level] }.keys
    when :as_experienced
      Current.user.experience_level
    when :more_experienced
      User.experience_levels.select { |_, v| v > User.experience_levels[Current.user.experience_level] }.keys
    else
      User.experience_levels.keys
    end
  end
end
