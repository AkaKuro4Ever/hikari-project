class BooksController < ApplicationController

  def new
    @book = Book.new(user_ids: params[:user_ids])
  end

  def create
    @book = Book.new(book_params)
    if @book.invalid?

      render :new
    else
      @book.save
      redirect_to book_path(@book)
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, genre_ids: [], user_ids: [])
  end
end
