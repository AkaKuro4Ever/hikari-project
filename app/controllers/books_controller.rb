class BooksController < ApplicationController

  def new
    @book = Book.new(user_ids: book_params[:user_ids])
  end

  def create
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
