class BooksSerializer
  include FastJsonapi::ObjectSerializer
    attributes :destination_city,
               :forecast,
               :total_books_found,
               :books
end
