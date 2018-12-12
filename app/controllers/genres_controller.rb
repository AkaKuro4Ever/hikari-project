class GenresController < ApplicationController

  def index
    @genres = Genre.all

  end

  def show
    @genre = Genre.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @genre}
    end
  end

  def create
  end
end
