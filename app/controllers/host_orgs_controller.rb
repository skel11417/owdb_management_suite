class HostOrgsController < ApplicationController
  before_action :set_host_org, only: [:show, :edit, :update, :destroy]

  # GET /host_orgs
  # GET /host_orgs.json
  def index
    @host_orgs = HostOrg.all
  end

  # GET /host_orgs/1
  # GET /host_orgs/1.json
  def show
  end

  # GET /host_orgs/new
  def new
    @host_org = HostOrg.new
  end

  # GET /host_orgs/1/edit
  def edit
  end

  # POST /host_orgs
  # POST /host_orgs.json
  def create
    @host_org = HostOrg.new(host_org_params)

    respond_to do |format|
      if @host_org.save
        format.html { redirect_to @host_org, notice: 'Host org was successfully created.' }
        format.json { render :show, status: :created, location: @host_org }
      else
        format.html { render :new }
        format.json { render json: @host_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host_orgs/1
  # PATCH/PUT /host_orgs/1.json
  def update
    respond_to do |format|
      if @host_org.update(host_org_params)
        format.html { redirect_to @host_org, notice: 'Host org was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_org }
      else
        format.html { render :edit }
        format.json { render json: @host_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_orgs/1
  # DELETE /host_orgs/1.json
  def destroy
    @host_org.destroy
    respond_to do |format|
      format.html { redirect_to host_orgs_url, notice: 'Host org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_org
      @host_org = HostOrg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_org_params
      params.fetch(:host_org, {})
    end
end
