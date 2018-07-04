class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    #ADD EDITING LOGIC
  end

  def update
    @user = User.find_by(id: params[:id])

    redirect_to user_path(@user)
  end

  def destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :username, :password, :password_confirmation)
  end
end
