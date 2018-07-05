class CommentsController < ApplicationController

  def create
    comment = Comment.create(comments_params)

    redirect_to book_path(comment.book)
  end

  private

  def comments_params
    params.permit(:content, :user_id, :book_id)
  end
end
