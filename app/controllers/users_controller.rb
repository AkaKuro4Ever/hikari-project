class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.invalid?
      render :new
    else
    @user.save
    session[:user_id] = @user.id
    binding.pry
    redirect_to user_path(@user)
    end
  end

  def show
  end

  def edit
  end

  def destroy

    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :email, :username, :password, :password_confirmation)
  end
end
