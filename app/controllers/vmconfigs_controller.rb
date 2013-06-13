class VmconfigsController < ApplicationController
  # GET /vmconfigs
  # GET /vmconfigs.json
  def index
    @vmconfigs = Vmconfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vmconfigs }
    end
  end

  # GET /vmconfigs/1
  # GET /vmconfigs/1.json
  def show
    @vmconfig = Vmconfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vmconfig }
    end
  end

  # GET /vmconfigs/new
  # GET /vmconfigs/new.json
  def new
    @vmconfig = Vmconfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vmconfig }
    end
  end

  # GET /vmconfigs/1/edit
  def edit
    @vmconfig = Vmconfig.find(params[:id])
  end

  # POST /vmconfigs
  # POST /vmconfigs.json
  def create
    @vmconfig = Vmconfig.new(params[:vmconfig])

    respond_to do |format|
      if @vmconfig.save
        format.html { redirect_to @vmconfig, notice: 'Vmconfig was successfully created.' }
        format.json { render json: @vmconfig, status: :created, location: @vmconfig }
      else
        format.html { render action: "new" }
        format.json { render json: @vmconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vmconfigs/1
  # PUT /vmconfigs/1.json
  def update
    @vmconfig = Vmconfig.find(params[:id])

    respond_to do |format|
      if @vmconfig.update_attributes(params[:vmconfig])
        format.html { redirect_to @vmconfig, notice: 'Vmconfig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vmconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmconfigs/1
  # DELETE /vmconfigs/1.json
  def destroy
    @vmconfig = Vmconfig.find(params[:id])
    @vmconfig.destroy

    respond_to do |format|
      format.html { redirect_to vmconfigs_url }
      format.json { head :no_content }
    end
  end
end
