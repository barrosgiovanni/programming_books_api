require 'rest-client'

puts "Cleaning database..."

Book.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating starter users..."

User.create(email: 'giovanni@gmail.com', password: '123456')
User.create(email: 'nilton@gmail.com', password: '123456')
User.create(email: 'davi@gmail.com', password: '123456')
User.create(email: 'joao@gmail.com', password: '123456')
User.create(email: 'barbara@gmail.com', password: '123456')
User.create(email: 'felipe@gmail.com', password: '123456')
User.create(email: 'tadeu@gmail.com', password: '123456')
User.create(email: 'julia@gmail.com', password: '123456')
User.create(email: 'luiz@gmail.com', password: '123456')
User.create(email: 'lana@gmail.com', password: '123456')
User.create(email: 'matheus@gmail.com', password: '123456')
User.create(email: 'alexandre@gmail.com', password: '123456')
User.create(email: 'lorene@gmail.com', password: '123456')

puts "Creating books..."

def google_books_api_key
  ENV["GOOGLE_BOOKS_API_KEY"]
end

def books_dataset
  api_data = { key: google_books_api_key }
  searches = ["javascript", "python", "java", "kotlin", "php",
              "swift", "ruby", "c++", "matlab", "typescript",
              "scala", "sql", "html", "css", "nosql", "rust", "perl"]
  searches.each do |language|
    books = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{language}+intitle:#{language}&download=epub&key=#{api_data[:key]}&maxResults=40")
    books_array = JSON.parse(books)["items"]
    books_array.each do |book|
      Book.create(
        title: book["volumeInfo"]["title"],
        author: book["volumeInfo"]["authors"] == nil ? nil : book["volumeInfo"]["authors"][0],
        publisher: book["volumeInfo"]["publisher"],
        year: book["volumeInfo"]["publishedDate"] == nil ? nil : book["volumeInfo"]["publishedDate"][0, 4].to_i,
        pages: book["volumeInfo"]["pageCount"],
        description: book["volumeInfo"]["description"],
        rating: book["volumeInfo"]["averageRating"],
        category: book["volumeInfo"]["categories"] == nil ? nil : book["volumeInfo"]["categories"][0],
        isbn: book["volumeInfo"]["industryIdentifiers"] == nil ? nil : book["volumeInfo"]["industryIdentifiers"][0]["identifier"],
        image_url: book["volumeInfo"]["imageLinks"] == nil ? nil : book["volumeInfo"]["imageLinks"]["thumbnail"],
        book_url: book["volumeInfo"]["infoLink"] == nil ? '' : book["volumeInfo"]["infoLink"],
        user_id: rand(1..13)
      )
    end
  end
end

books_dataset()

puts "Creating reviews..."

def reviews_dataset
  library_size = Book.count
  (library_size * 3).times do
    Review.create(
      score: rand(1..5),
      content: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
      user_id: rand(1..13),
      book_id: rand(1..library_size)
    )
  end
end

reviews_dataset()

puts "Finished seeding the app!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
