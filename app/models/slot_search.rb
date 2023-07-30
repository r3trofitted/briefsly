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
  
  def slots
    slots = Slot.includes(:user).where.not(user: Current.user)

    slots = slots.by_repository(repository_name) if repository_name.present?
    slots = slots.by_issue(issue_number) if issue_number.present?
    slots = slots.references(:user).merge(User.by_buddyname(buddy_name)) if buddy_name.present?

    slots.limit(48)
    
    slots
  end
end
