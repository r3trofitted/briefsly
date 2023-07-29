class JamsController < ApplicationController
  before_action :set_slot

  def new
    @jam = Jam.new
  end

  def create
    @slot.create_jam!(guest: current_user)

    redirect_to my_schedule_path
  end

  private

  def set_slot
    @slot = Slot.find params[:slot_id]
  end
end