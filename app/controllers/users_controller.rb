class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :password, :update_password]
  before_action :authenticate_user!, only: [:edit, :update, :password, :update_password]
  before_action :authorize_user!, only: [:edit, :update, :password, :update_password]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully created an account!"
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
    @user=current_user
        if params[:user][:password] == params[:user][:current_password]
            flash[:alert] = "Can not use current password"
            render :password
        elsif @user&.authenticate(params[:user][:current_password])
            if @user.update user_params
                redirect_to edit_user_path, notice: "Successfully changed password"
            else
                flash[:alert] = "Passwords did not match"
                render :password
            end
        else
          flash[:alert] = "Current password incorrect"
            render :password
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

  def authorize_user!
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud,@user)
  end

end
