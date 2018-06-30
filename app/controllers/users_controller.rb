class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      binding.pry
    else
      render :new
    end
  end
  # def create
  #   @user = User.new(user_params)
  #   @user.save ? (session[:user_id] = @user.id; redirect_to user_path(@user)) : (render :new)
  # end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
  end

  def destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
