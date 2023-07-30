class JamsController < ApplicationController
  before_action :set_slot, only: [:new, :create]
  before_action :set_jam, only: [:show, :accept, :declines]

  def show
  end

  def new
    @jam = Jam.new
  end

  def create
    @slot.create_jam!(guest: Current.user)

    redirect_to schedule_path, status: :see_other
  end
  
  def accept
    if @jam
      @jam.accepted!
      
      redirect_to @jam, status: :see_other # TODO: see_other, really?
    else
      # TODO
    end
  end
  
  def decline
    if @jam
      @jam.declined!
      
      redirect_to @jam, status: :see_other # TODO: see_other, really?
    else
      # TODO
    end
  end

  private

  def set_slot
    @slot = Slot.find params[:slot_id]
  end
  
  def set_jam
    @jam = Current.user.hosting_jams.find_by(id: params[:id])
  end
end
