class SlotsController < ApplicationController
  before_action :authenticate_user!

  def index
    @slots = Slot.includes(:user).all
    @slots = @slots.by_repository(repository_name) if repository_name
    @slots = @slots.by_issue(issue_number) if issue_number
  end

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

  def repository_name
    params[:repository_name]
  end

  def issue_number
    params[:issue_number]
  end
end
