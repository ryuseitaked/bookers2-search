class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @uers =User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end

end
