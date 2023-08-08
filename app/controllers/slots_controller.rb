class SlotsController < ApplicationController
  def index
    @search = SlotSearch.new(search_params)
  end
  
  def new
    @slot = Slot.new
  end

  def create
    @slot = Current.user.slots.build(slot_params)

    if @slot.save
      redirect_back_or_to root_path
    else
      render status: :unprocessable_entity
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:repository, :issue_number, :start_at, :end_at)
  end
  
  def search_params
    params.fetch(:q, {}).permit!
  end
end
