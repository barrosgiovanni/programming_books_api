json.array! @books do |book|
  json.extract! book, :id, :title, :author, :publisher, :category, :isbn, :image_url, :book_url, :year, :pages, :description, :rating
end
