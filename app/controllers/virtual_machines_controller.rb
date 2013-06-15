class VirtualMachinesController < ApplicationController
  # GET /virtual_machines
  # GET /virtual_machines.json
  def index
    @virtual_machines = VirtualMachine.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_machines }
    end
  end

  # GET /virtual_machines/1
  # GET /virtual_machines/1.json
  def show
    @virtual_machine = VirtualMachine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @virtual_machine }
    end
  end

  # GET /virtual_machines/new
  # GET /virtual_machines/new.json
  def new
    @os_images = OsImage.all
    @vmconfigs = Vmconfig.all
    @virtual_machine = VirtualMachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @virtual_machine }
    end
  end

  # GET /virtual_machines/1/edit
  def edit
    @os_images = OsImage.all
    @vmconfigs = Vmconfig.all
    @virtual_machine = VirtualMachine.find(params[:id])
  end

  # POST /virtual_machines
  # POST /virtual_machines.json
  def create
    
    params[:virtual_machine][:connection_s]="vnc to 217.197.0.127:5901"
    params[:virtual_machine][:user_id] = current_user.id
    @virtual_machine = VirtualMachine.new(params[:virtual_machine])

    
    respond_to do |format|
      if @virtual_machine.save
        
        @vmconfig = Vmconfig.find((params[:virtual_machine][:vmconfig_id]))
        @os_image = OsImage.find(params[:virtual_machine][:os_image_id])
        @msg={}
        @msg[:action] = "START"
        @msg[:params] = {}
        @msg[:params][:vm_id] = params[:virtual_machine][:name]
        @msg[:params][:user_id] = params[:virtual_machine][:user_id].to_s
        @msg[:params][:image] = @os_image.file
        @msg[:params][:memory] = @vmconfig.memory
        VirtualMachinesController.nameless_exchange.publish @msg.to_json,:key => "ui.to.mng"                                        

        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully created.' }
        format.json { render json: @virtual_machine, status: :created, location: @virtual_machine }
      else
        format.html { render action: "new" }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  def save
    @virtual_machine = VirtualMachine.find(params[:id])
    @serv = Server.find(@virtual_machine.server_id)
    @msg = {}
    @msg[:action] = "SAVE"
    @msg[:params] = {}
    @msg[:params][:uuid] = @virtual_machine.uuid
    @msg[:params][:server_uuid] = @serv.key
    @msg[:params][:user_id] = @virtual_machine.user_id.to_s
    VirtualMachinesController.nameless_exchange.publish @msg.to_json,:key => "ui.to.mng"
    redirect_to :action => "index"
  end

  def start
    @virtual_machine = VirtualMachine.find(params[:id])
    @serv = Server.find(@virtual_machine.server_id)
    @msg = {}
    @msg[:action] = "SAVEDSTART"
    @msg[:params] = {}
    @msg[:params][:uuid] = @virtual_machine.uuid
    @msg[:params][:server_uuid] = @serv.key
    @msg[:params][:user_id] = @virtual_machine.user_id.to_s
    @msg[:params][:filename] = @virtual_machine.filename
    VirtualMachinesController.nameless_exchange.publish @msg.to_json,:key => "ui.to.mng"
    redirect_to :action => "index"
  end
  # PUT /virtual_machines/1
  # PUT /virtual_machines/1.json
  def update
    @virtual_machine = VirtualMachine.find(params[:id])

    respond_to do |format|
      if @virtual_machine.update_attributes(params[:virtual_machine])
        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_machines/1
  # DELETE /virtual_machines/1.json
  def destroy
    @virtual_machine = VirtualMachine.find(params[:id])
    @virtual_machine.destroy

    respond_to do |format|
      format.html { redirect_to virtual_machines_url }
      format.json { head :no_content }
    end
  end

end
