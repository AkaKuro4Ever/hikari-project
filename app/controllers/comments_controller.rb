class CommentsController < ApplicationController

  def create
    comment = Comment.create(comments_params)

    redirect_to book_path(comment.book)
  end

  def destroy
    binding.pry
    @comment = Comment.find_by(id: comments_params[:comment_id])
    book = @comment.book
    @comment.destroy

    redirect_to book_path(book)
  end

  private

  def comments_params
    params.permit(:content, :user_id, :book_id, :comment_id)
  end
end
