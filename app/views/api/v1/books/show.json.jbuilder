json.extract! @book, :id, :title, :author, :publisher, :year, :category, :description, :isbn, :pages, :image_url, :book_url, :rating
json.reviews @book.reviews do |review|
  json.extract! review, :id, :user_id, :score, :content
  # json.user do
  #   json.id review.user.id
  # end
end
