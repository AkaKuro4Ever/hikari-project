class ChaptersController < ApplicationController

  def create
    @chapter = Chapter.create(chapters_params)

    # redirect_to book_path(chapter.book)
    render json: @chapter, status: 201
  end

  def chapter_data
    @chapter = Chapter.find(params[:id])
    render json: @chapter
  end

  def destroy
    @chapter = Chapter.find_by(id: chapters_params[:chapter_id])
    book = @chapter.book
    @chapter.destroy

    redirect_to book_path(book)
  end

  private

  def chapters_params
    params.permit(:content, :bood_id)
  end
end
