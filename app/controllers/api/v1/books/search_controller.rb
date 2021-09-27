class Api::V1::Books::SearchController < ApplicationController
  def index
    books = BookFacade.books_by_location(params[:location], params[:quantity])
    render json: BooksSerializer.new(books)
  end
end

# add error handling if time
