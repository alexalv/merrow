class OsImagesController < ApplicationController
  # GET /os_images
  # GET /os_images.json
  def index
    @os_images = OsImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @os_images }
    end
  end

  # GET /os_images/1
  # GET /os_images/1.json
  def show
    @os_image = OsImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @os_image }
    end
  end

  # GET /os_images/new
  # GET /os_images/new.json
  def new
    @msg = {}
    @msg['action'] = 'REINDEX'
    OsImagesController.nameless_exchange.publish @msg.to_json,:key => "ui.to.mng" 

    respond_to do |format|
      format.html {redirect_to(:os_images)}
      format.json { render json: @os_image }
    end
  end

  # GET /os_images/1/edit
  def edit
    @os_image = OsImage.find(params[:id])
  end

  # POST /os_images
  # POST /os_images.json
  def create
    require 'fileutils'
    
    file = File.join("public/inner", params[:os_image][:file].original_filename)
    File.open(file, "wb") { |f| f.write(params[:os_image][:file].read) }

    @os_image = OsImage.new({:system =>params[:os_image][:system],
                             :description => params[:os_image][:description],
                             :file => "/inner/"+params[:os_image][:file].original_filename})

    respond_to do |format|
      if @os_image.save
        format.html { redirect_to @os_image, notice: 'Os image was successfully created.' }
        format.json { render json: @os_image, status: :created, location: @os_image }
      else
        format.html { render action: "new" }
        format.json { render json: @os_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /os_images/1
  # PUT /os_images/1.json
  def update
    @os_image = OsImage.find(params[:id])

    respond_to do |format|
      if @os_image.update_attributes(params[:os_image])
        format.html { redirect_to @os_image, notice: 'Os image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @os_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_images/1
  # DELETE /os_images/1.json
  def destroy
    @os_image = OsImage.find(params[:id])
    @os_image.destroy

    respond_to do |format|
      format.html { redirect_to os_images_url }
      format.json { head :no_content }
    end
  end

  

end
