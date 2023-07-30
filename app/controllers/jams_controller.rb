class JamsController < ApplicationController
  before_action :set_slot

  def new
    @jam = Jam.new
  end

  def create
    @slot.create_jam!(guest: Current.user)

    redirect_to schedule_path
  end

  private

  def set_slot
    @slot = Slot.find params[:slot_id]
  end
end
