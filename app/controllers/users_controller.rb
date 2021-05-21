class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :password, :update_password]
  before_action :authenticate_user!, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully created an account!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @user.update user_params
      flash[:notice] = "User details updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def password
    
  end

  def update_password
    if @user.update user_params
      flash[:notice] = "Password updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end

  def find_user
    @user = User.find params[:id]
  end

end
