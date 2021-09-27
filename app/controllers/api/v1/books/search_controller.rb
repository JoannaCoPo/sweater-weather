class Api::V1::Books::SearchController < ApplicationController
  def index
    params[:location] && params[:quantity] ? initialize_serializer : invalid_params
  end

  def initialize_serializer
    books = BookFacade.books_by_location(params[:location], params[:quantity])
    render json: BooksSerializer.new(books)
  end

  def invalid_params
    render json: { errors: 'No location or quantity specified' }, status: 400
  end
end
