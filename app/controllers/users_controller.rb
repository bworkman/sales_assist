class UsersController < ApplicationController

  def show
    @user = current_user
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.registration_confirmation(@user).deliver_now
      log_in_user(@user)
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password)
  end

end
