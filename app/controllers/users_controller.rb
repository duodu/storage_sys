class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @competence_array = Competence.all.map { |c| [c.name, c.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @competence_array = Competence.all.map { |c| [c.name, c.id] }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @competence_array = Competence.all.map { |c| [c.name, c.id] }

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  #登录
  def login
    uname=params[:name]
    upass=params[:password]
    user=User.find_by_name_and_password(uname,upass)
    reset_session
    if user
      session[:user_id]=user.id
      @user=User.find(user.id)
      flash[:notice] = ["Successfully login"]
      redirect_to :controller => "cagos", :action => "index"
    else
      redirect_to :controller => "cagos", :action => "index"
      flash[:notice] = ["login failed"]
    end
  end
  #注销用户
  def logout
    reset_session
    redirect_to :controller => "cagos", :action => "index"
  end
end
