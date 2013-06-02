class CompetencesController < ApplicationController
  # GET /competences
  # GET /competences.json
  def index
    @competences = Competence.all
    if @competences.empty?
      redirect_to :action => "new"
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @competences }
      end
    end
  end

  # GET /competences/1
  # GET /competences/1.json
  def show
    @competence = Competence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @competence }
    end
  end

  # GET /competences/new
  # GET /competences/new.json
  def new
    @competence = Competence.new
    @status_array = Status.all.map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competence }
    end
  end

  # GET /competences/1/edit
  def edit
    @competence = Competence.find(params[:id])
    @status_array = Status.all.map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
  end

  # POST /competences
  # POST /competences.json
  def create
    @competence = Competence.new(params[:competence])
    @status_array = Status.all.map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
    if @competence.ostatus_id == @competence.nstatus_id
      @competence.errors.add :name, "can not have same status."
    end

    respond_to do |format|
      if @competence.ostatus_id != @competence.nstatus_id && @competence.save
        format.html { redirect_to @competence, notice: 'Competence was successfully created.' }
        format.json { render json: @competence, status: :created, location: @competence }
      else
        format.html { render action: "new" }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /competences/1
  # PUT /competences/1.json
  def update
    @competence = Competence.find(params[:id])

    respond_to do |format|
      if @competence.update_attributes(params[:competence])
        format.html { redirect_to @competence, notice: 'Competence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1
  # DELETE /competences/1.json

end
