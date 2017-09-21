class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to books_path
    else
      render 'new_error'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    reset_session
  end

end
