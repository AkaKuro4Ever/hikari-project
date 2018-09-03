class BooksController < ApplicationController

before_action :require_login
skip_before_action :require_login, only: [:index, :show]
before_action :set_book
skip_before_action :set_book, only: [:new, :create, :index, :edit, :hikari_faves]

  def index
    @user = User.find_by(id: params[:user_id])
    if params[:user_id]
      @books = User.find_by(id: params[:user_id]).books
    elsif params[:genre_id]
      @books = Genre.find_by(id: params[:genre_id]).books
      render json: @books
    else
      @books = Book.all
    end

  end

  def new
    @book = Book.new(user_ids: params[:user_id])
  end

  def create
    @book = Book.create(book_params)
    if @book.invalid?
      render :new
    else
     @book.users << current_user if @book.save
     redirect_to book_path(@book)
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @book}
    end
  end

  def edit
    if params[:user_id]
    @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "Author not found."
      elsif  !@book = @user.books.find_by(id: params[:id])
        redirect_to user_books_path(@user), alert: "Book not found."
      else
        redirect_to user_books_path(@user) if logged_in? && !@book.users.find_by(id: current_user.id)
      end
    else
    @post = Post.find(params[:id])
    end
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  def follow
    @book.followers << current_user if !current_user.following.find_by(id: @book.id)
    redirect_to book_path(@book)
  end

  def unfollow
    current_user.following.delete(Book.find(@book.id)) if current_user.following.find_by(id: @book.id)
    redirect_to book_path(@book)
  end

  def hikari_faves
    @books = Book.favs
  end

  private

  def require_login
    redirect_to login_path if !logged_in?
  end

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:id, :title, :summary, genre_ids: [], user_ids: [])
  end
end
