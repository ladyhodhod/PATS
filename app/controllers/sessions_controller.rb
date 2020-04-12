class SessionsController < ApplicationController
  def new
    # rendering the view
  end

  def create
    user=User.authenticate(params[:username], params[:password])
    if user # the user exists and authentication is successful
      session[:user_id]=user.id 
      # flash[:notice]='Logged in!'
      redirect_to home_path, notice: 'Logged in!'
    else 
      flash.now.alert = "Username and/or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Logged out!'
  end
end


