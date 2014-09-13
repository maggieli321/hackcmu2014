<<<<<<< HEAD
class UsersController < ApplicationController
  authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:new, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
      #flash[:notice] = "#{@user.username} has been notified by email."
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
    @reminder = ReminderMailer.food_reminder_msg(@user).deliver
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(home_path, :notice => 'User was successfully created.')
    else
      flash[:error] = "This user could not be created."
        render "new"
    end
    # respond_to do |format|
      # if @user.save
      #   format.html { redirect_to @user, notice: 'User was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @user }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.username} was revised in the system."
      redirect_to @user
    else
      render :action => 'edit'
    end
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed #{@user.username}."
    redirect_to users_url
    # respond_to do |format|
    #   format.html { redirect_to users_url }
    #   format.json { head :no_content }
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :role)
    end
end
=======
class UsersController < ApplicationController
  #authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:new, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
      #flash[:notice] = "#{@user.username} has been notified by email."
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
    @reminder = ReminderMailer.food_reminder_msg(@user).deliver
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(home_path, :notice => 'User was successfully created.')
    else
      flash[:error] = "This user could not be created."
        render "new"
    end
    # respond_to do |format|
      # if @user.save
      #   format.html { redirect_to @user, notice: 'User was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @user }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.username} was revised in the system."
      redirect_to @user
    else
      render :action => 'edit'
    end
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed #{@user.username}."
    redirect_to users_url
    # respond_to do |format|
    #   format.html { redirect_to users_url }
    #   format.json { head :no_content }
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :role)
    end
end
>>>>>>> c6c9346e8b08ddc7015320a60ce82ec9ccb6a73a
