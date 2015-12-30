class SessionsController < ApplicationController

  def login_form
    
  end

  def login
    if params[:email].present? && params[:password].present?
      user = User.find_by(email: params[:email], encrypted_password: params[:password])
      if user
        log_in_user(user)
        redirect_to home_path, notice: 'logged in'
      else
        redirect_to login_form_path, notice: 'did not find a user with those credentials'
      end
    else
      redirect_to login_form_path, notice: 'we need to have an email and a password'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_path, notice: 'logged out'
  end

end
