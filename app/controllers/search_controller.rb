class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @books = Book.all
  end

  def search
    @range = params[:range]
    if @range == "User"
      @uers =User.looks(params[:search], params[:word])
      redirect_to search_index_path
    else
      @books = Book.looks(params[:search], params[:word])
      redirect_to search_index_path
    end
  end

end
