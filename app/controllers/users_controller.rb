class UsersController < ApplicationController

  def new
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
