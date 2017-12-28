class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :change_status, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @task_types = TaskType.all.order(:date_offset)
    @pods = Pod.all.includes(:tasks, :task_types).for_month_year(set_month, set_year)
    @month = set_month
    @year = set_year
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    respond_to do |format|
        # how to redirect_to current page?

        if @task.completed
          @task.update(:completed => false)
          format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
        else
          @task.update(:completed => true)
          format.html { redirect_to request.referrer, notice: 'Task was successfully updated.' }
        end
    end


  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:completed)
    end

    def set_month
      params[:month] ? params[:month].to_i : Date.today.month
    end

    def set_year
      params[:year] ? params[:year].to_i : Date.today.year
    end


end
