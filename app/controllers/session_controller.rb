class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]

    if user.present? && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Invalid username or password"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
