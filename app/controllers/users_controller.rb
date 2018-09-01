class UsersController < ApplicationController

before_action :set_user
skip_before_action :set_user, only: [:destroy, :create, :index, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @book_ids = @user.user_book_ids
    # render json: @user
  end

  def edit
    if @user.nil?
      redirect_to users_path, alert: "Author not found."
    elsif !@user.uid.nil?
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(username: params[:username])
    @user.destroy
    redirect_to '/'
  end

  def blog
  end

  def editblog
    redirect_to blog_path if @user != current_user
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :email, :username, :password, :password_confirmation)
  end
end
