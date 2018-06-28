class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    #do validation here
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :email, :username, :password, :password_confirmation)
  end
end
