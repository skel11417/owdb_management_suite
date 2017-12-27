class ChecklistController < ApplicationController

  def index
    @task_types = TaskType.all.order(:date_offset)
    @pods = Pod.all.includes(:tasks, :task_types)
  end



end
