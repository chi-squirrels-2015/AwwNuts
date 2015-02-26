class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path, notice: "Welcome #{@user.first_name} to AwwNuts!"
    else
      @error = @user.errors
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :avatar_url, :catch_phrase)
  end
end