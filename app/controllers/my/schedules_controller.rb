class My::SchedulesController < ApplicationController
  def show
    @slots = Current.user.slots
    @hosting_jams  = Current.user.hosting_jams
    @guesting_jams = Current.user.guesting_jams
  end
end
