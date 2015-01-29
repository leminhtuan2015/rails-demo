class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #logging in is handled by sending a POST request to the create action 

  	email = params[:session][:email].downcase
    pass = params[:session][:password];

    user = User.find_by(email: email)
    if user && pass==(user.password)
      log_in user
      redirect_to current_user
      #infer that /user(current_user) => call user#show
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #logging out is handled by sending a DELETE request to the destroy action 
    log_out
    redirect_to root_url
  end
end
