class UsersController < ApplicationController

  # Show all users
  # GET /users
  def index
    @users = User.all
  end

  # Show user
  # GET /users/1
  def show
    @user
  end

  def new
    @users = User.new
  end

  # Edit user with given ID
  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy(name)
    @users = User.find_by(name: name.to_s)
    if @users != nil
      @users.destroy
      @users.save
    else
      # ERROR USER NOT FOUND
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
