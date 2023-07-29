class My::SchedulesController < ApplicationController
  def show
    @schedule = Schedule.new(Current.user)
  end
end
