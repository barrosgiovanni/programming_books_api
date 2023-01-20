json.array! @books do |book|
  json.extract! book, :id, :title, :author, :publisher, :year, :category, :description, :isbn, :pages, :image_url, :book_url, :rating
end
