class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
    	# Redirect to /user <=> call show action
    	# Just pass :id for /users (/users/:id)
      redirect_to @user 
    else
      render 'new'
    end
  end

   def show
  	@user = User.find(params[:id])
    @entries = @user.entry
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
  end

end
