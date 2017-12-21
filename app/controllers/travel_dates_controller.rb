class TravelDatesController < ApplicationController
  before_action :set_travel_date, only: [:show, :edit, :update, :destroy]

  # GET /travel_dates
  # GET /travel_dates.json
  def index
    @travel_dates = TravelDate.all
  end

  # GET /travel_dates/1
  # GET /travel_dates/1.json
  def show
  end

  # GET /travel_dates/new
  def new
    @travel_date = TravelDate.new
  end

  # GET /travel_dates/1/edit
  def edit
  end

  # POST /travel_dates
  # POST /travel_dates.json
  def create
    @travel_date = TravelDate.new(travel_date_params)

    respond_to do |format|
      if @travel_date.save
        format.html { redirect_to @travel_date, notice: 'Travel date was successfully created.' }
        format.json { render :show, status: :created, location: @travel_date }
      else
        format.html { render :new }
        format.json { render json: @travel_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_dates/1
  # PATCH/PUT /travel_dates/1.json
  def update
    respond_to do |format|
      if @travel_date.update(travel_date_params)
        format.html { redirect_to @travel_date, notice: 'Travel date was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_date }
      else
        format.html { render :edit }
        format.json { render json: @travel_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_dates/1
  # DELETE /travel_dates/1.json
  def destroy
    @travel_date.destroy
    respond_to do |format|
      format.html { redirect_to travel_dates_url, notice: 'Travel date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_date
      @travel_date = TravelDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_date_params
      params.fetch(:travel_date, {})
    end
end