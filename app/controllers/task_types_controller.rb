class TaskTypesController < ApplicationController
  before_action :set_task_type, only: [:show, :update, :destroy]
  before_action :format_date, only: :edit
  # GET /task_types
  # GET /task_types.json
  def index
    @task_types = TaskType.all.order(:date_offset)
  end

  # GET /task_types/1
  # GET /task_types/1.json
  def show
  end

  # GET /task_types/new
  def new
    @task_type = TaskType.new
  end

  # GET /task_types/1/edit
  def edit
  end

  # POST /task_types
  # POST /task_types.json
  def create
    @task_type = TaskType.new(task_type_params)
    respond_to do |format|
      if @task_type.save
        generate_tasks(@task_type)
        format.html { redirect_to @task_type, notice: 'Task type was successfully created.' }
        format.json { render :show, status: :created, location: @task_type }
      else
        format.html { render :new }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_types/1
  # PATCH/PUT /task_types/1.json
  def update
    respond_to do |format|
      if @task_type.update(task_type_params)
        format.html { redirect_to @task_type, notice: 'Task type was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_type }
      else
        format.html { render :edit }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.json
  def destroy
    @task_type.destroy
    respond_to do |format|
      format.html { redirect_to task_types_url, notice: 'Task type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_type
      @task_type = TaskType.find(params[:id])
    end

    def format_date
      @task_type = TaskType.find(params[:id])

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_type_params
      date_offset = params[:task_type][:date_offset].to_i
      factor = -7
      trvl_date_offset = 0
      if params[:task_type][:timeframe] == 'post'
        factor = 7
        trvl_date_offset = 10
      end
        params[:task_type][:date_offset] = date_offset * factor + trvl_date_offset
        params[:task_type].delete :timeframe
        params.require(:task_type).permit(:name, :date_offset)
    end

    def generate_tasks(task_type)
      task_type_id = task_type.id
      Pod.all.each do |pod|
        t = Task.new
        t.task_type_id = task_type_id
        t.pod_id = pod.id
        t.completed = false
        t.save
      end
    end
end
