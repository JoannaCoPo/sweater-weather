class BooksSerializer
  include FastJsonapi::ObjectSerializer
    attributes :destination_city, :book_quantity, :book #book_info
end
