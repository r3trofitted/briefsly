class My::SchedulesController < ApplicationController
  def show
    @slots = current_user.slots
    @hosting_jams  = current_user.hosting_jams
    @guesting_jams = current_user.guesting_jams
  end
end
