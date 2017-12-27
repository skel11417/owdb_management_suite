class DashboardController < ApplicationController
  def index
    @date = Date.new(2018,1,29)
    @tasks = TaskType.all
  end

  def update_task
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to dashboard_url, notice: 'Task was successfully updated.' }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def task_params
    params.require(:task).permit(:completed)
  end
end
