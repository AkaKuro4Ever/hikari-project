class BooksController < ApplicationController

  def index
    if params[:user_id]
      @books = User.find_by(id: params[:user_id]).books
      @user = User.find_by(id: params[:user_id])
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new(user_ids: params[:user_id])
  end

  def create

    @book = Book.new(book_params)
    @book.users << current_user
    if @book.invalid?

      render :new
    else
      @book.save
      redirect_to book_path(@book)
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
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
    @book = Book.find_by(id: params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @user = User.find_by(username: params[:username])
    @user.destroy
  end

  def follow
    @book = Book.find_by(id: params[:id])
    @book.followers << current_user if !current_user.following.find_by(id: @book.id)
    redirect_to book_path(@book)
  end

  def unfollow
    @book = Book.find_by(id: params[:id])
    current_user.following.delete(Book.find(@book.id)) if current_user.following.find_by(id: @book.id)
    redirect_to book_path(@book)
  end

  def hikari_faves
    @books = Book.favs
  end

  private

  def book_params
    params.require(:book).permit(:id, :title, :summary, genre_ids: [], user_ids: [])
  end
end
