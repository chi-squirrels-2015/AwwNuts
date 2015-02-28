class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in as #{user.email}."
      redirect_to dashboard_path
    else
      @email = params[:email]
      flash[:alert] = "Email/password combination not valid."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end