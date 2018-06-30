class ApplicationController < ActionController::Base

  def index
    @books = Book.all
  end

  helpers do

    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

  end
end
