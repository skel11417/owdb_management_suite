class DashboardController < ApplicationController
  def index
    @date = Date.new(2018,1,29)
    @tasks = TaskType.all
  end
end
