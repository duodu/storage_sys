class CagosController < ApplicationController
  # GET /cagos
  # GET /cagos.json
  def index
    @cagos = Cago.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cagos }
    end
  end

  # GET /cagos/1
  # GET /cagos/1.json
  def show
    @cago = Cago.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cago }
    end
  end

  # GET /cagos/new
  # GET /cagos/new.json
  def new
    @cago = Cago.new
    @status_array = Status.all.map { |s| [s.name, s.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cago }
    end
  end

  # GET /cagos/1/edit
  def edit
    @cago = Cago.find(params[:id])
    @status_array = Status.all.map { |s| [s.name, s.id] }
  end

  # POST /cagos
  # POST /cagos.json
  def create
    @cago = Cago.new(params[:cago])
    @status_array = Status.all.map { |s| [s.name, s.id] }

    respond_to do |format|
      if @cago.save
        format.html { redirect_to @cago, notice: 'Cago was successfully created.' }
        format.json { render json: @cago, status: :created, location: @cago }
      else
        format.html { render action: "new" }
        format.json { render json: @cago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cagos/1
  # PUT /cagos/1.json
  def update
    @cago = Cago.find(params[:id])

    respond_to do |format|
      if @cago.update_attributes(params[:cago])
        format.html { redirect_to @cago, notice: 'Cago was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cagos/1
  # DELETE /cagos/1.json
  def destroy
    @cago = Cago.find(params[:id])
    @cago.destroy

    respond_to do |format|
      format.html { redirect_to cagos_url }
      format.json { head :no_content }
    end
  end
end
