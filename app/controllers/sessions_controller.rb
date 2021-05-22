class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      flash[:notice] = 'Logged In!'
      redirect_to root_path
    else
      flash[:notice] = 'Incorrect log in information.'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged Out'
    redirect_to root_path
  end

end
