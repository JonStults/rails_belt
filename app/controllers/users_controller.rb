class UsersController < ApplicationController
  def index
    render 'index'
  end

  def log_user
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/groups"
    else
      flash[:log_error] = 'Invalid email/password combination'
      return redirect_to '/'
    end
  end

  def create_user
    user = User.create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password])
    if !user.errors.blank?
      flash[:errors] = user.errors.messages
      return redirect_to '/'
    end
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Registration Successful"
    else
      flash.now[:errors] = 'Invalid email/password combination'
      return redirect_to '/'
    end
    return redirect_to '/groups'
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
