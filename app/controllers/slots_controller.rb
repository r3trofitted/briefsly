class SlotsController < ApplicationController
  before_action :authenticate_user!

  def create
    @slot = current_user.slots.build(slot_params)

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
end
