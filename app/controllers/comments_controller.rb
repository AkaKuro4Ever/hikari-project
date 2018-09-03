class CommentsController < ApplicationController

  def create
    comment = Comment.create(comments_params)

    # redirect_to book_path(comment.book)
    render json: @comment, status: 201
  end

  def comment_data
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def destroy
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
