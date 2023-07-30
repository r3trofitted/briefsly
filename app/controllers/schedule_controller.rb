class ScheduleController < ApplicationController
  def show
    @schedule = Schedule.new(Current.user)
  end
end
