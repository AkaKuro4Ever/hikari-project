class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
    else
      render '/signup'
    end
  end

  def destroy
    session.delete :user_id
  end
end
