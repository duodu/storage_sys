class CagosController < ApplicationController
  # GET /cagos
  # GET /cagos.json
  def index
    if Status.all.last.id != 4
      redirect_to new_status_path
      flash[:notice] = ["You need to add some statuses."]
    elsif Competence.all.last.id == 2
      redirect_to new_competence_path
      flash[:notice] = ["You need to add some competences."]
    elsif User.all.empty?
      redirect_to new_user_path
      flash[:notice] = ["You need to add some users."]
    elsif User.where("competence_id=?",1).empty?
      redirect_to new_user_path
      flash[:notice] = ["You need to create one user to add a new cago at least."]
    elsif User.where("competence_id=?",2).empty?
      redirect_to new_user_path
      flash[:notice] = ["You need to create one user to destroy one cago at least."]
    else
       if session[:user_id]
        @user = User.find(session[:user_id])
        if @user.competence_id ==2 
          @cagos = Cago.all
        else
          @cagos = Cago.where("status_id=?",@user.competence.ostatus_id)
        end
      else
        @cagos = Cago.all
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cagos }
      end
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
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.competence_id == 1
        @cago = Cago.new
        @status_array = Status.all.map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
    
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @cago }
        end
      else
        redirect_to :action => "index"
        flash[:notice] = ["Sorry, you have no competence."]
      end
    else
      redirect_to :action => "index"
      flash[:notice] = ["You need to login first."]
    end

  end

  # GET /cagos/1/edit
  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
      @cago = Cago.find(params[:id])
      if @user.competence.ostatus_id == @cago.status_id
        @status_array = Status.where("id=? or id=?",@user.competence.ostatus_id,@user.competence.nstatus_id).map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
      else
        redirect_to :action => "index"
        flash[:notice] = ["Sorry, you have no competence."]
      end
      
    else
      redirect_to :action => "index"
      flash[:notice] = ["You need to login first."]
    end
  end

  # POST /cagos
  # POST /cagos.json
  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.competence_id == 1
        @cago = Cago.new(params[:cago])
        @status_array = Status.all.map { |s| [s.name, s.id] } -[["NULL",1],["NOT NULL",2]]
    
        respond_to do |format|
          if @cago.save
            format.html { redirect_to @cago, notice: 'Cago was successfully created.' }
            format.json { render json: @cago, status: :created, location: @cago }
          else
            @status_array = Status.all.map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
            format.html { render action: "new" }
            format.json { render json: @cago.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to :action => "index"
        flash[:notice] = ["Sorry, you have no competence."]
      end
    else
      redirect_to :action => "index"
      flash[:notice] = ["You need to login first."]
    end
    
  end

  # PUT /cagos/1
  # PUT /cagos/1.json
  def update
    if session[:user_id]
      @cago = Cago.find(params[:id])
      @user = User.find(session[:user_id])
      if @user.competence.ostatus_id == @cago.status_id
        respond_to do |format|
          if @cago.update_attributes(params[:cago])
            format.html { redirect_to @cago, notice: 'Cago was successfully updated.' }
            format.json { head :no_content }
          else
            @status_array = Status.where("id=? or id=?",@user.competence.ostatus_id,@user.competence.nstatus_id).map { |s| [s.name, s.id] }-[["NULL",1],["NOT NULL",2]]
            format.html { render action: "edit" }
            format.json { render json: @cago.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to :action => "index"
        flash[:notice] = ["Sorry, you have no competence."]
      end
    else
      redirect_to :action => "index"
      flash[:notice] = ["You need to login first."]
    end
    


  end

  # DELETE /cagos/1
  # DELETE /cagos/1.json
  def destroy
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.competence_id == 2
        @cago = Cago.find(params[:id])
        @cago.destroy
    
        respond_to do |format|
          format.html { redirect_to cagos_url }
          format.json { head :no_content }
        end
      else
        redirect_to :action => "index"
        flash[:notice] = ["Sorry, you have no competence."]
      end
    else
      redirect_to :action => "index"
      flash[:notice] = ["You need to login first."]
    end

  end
end
