require 'rest-client'

puts "Cleaning database..."

Book.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating starter users..."

giovanni = User.create(email: 'barrosgiovanni@icloud', password: '123456')
nilton = User.create(email: 'niltonduarte@gmail.com', password: '123456')

puts "Creating books..."

def google_books_api_key
  ENV["GOOGLE_BOOKS_API_KEY"]
end

def books_dataset
  api_data = { key: google_books_api_key }
  searches = ["javascript", "python", "java", "kotlin", "php", "c#", "swift", "ruby", "c++", "matlab", "typescript", "scala", "sql", "html", "css", "nosql", "rust", "perl"]

  searches.each do |search|
    books = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{search}+intitle:#{search}&key=#{api_data[:key]}&maxResults=40")
    books_array = JSON.parse(books)["items"]
    books_array.each do |book|
      Book.create(
        title: book["volumeInfo"]["title"],
        author: book["volumeInfo"]["authors"]["0"],
        publisher: book["volumeInfo"]["publisher"],
        year: book["volumeInfo"]["publishedDate"][0, 4].to_i,
        pages: book["volumeInfo"]["pageCount"],
        description: book["volumeInfo"]["description"],
        rating: book["volumeInfo"]["averageRating"],
        category: books["volumeInfo"]["categories"]["0"],
        isbn: books["volumeInfo"]["industryIdentifiers"]["0"]["identifier"],
        image_url: books["volumeInfo"]["imageLinks"]["thumbnail"],
        book_url: books["volumeInfo"]["infoLink"],
        user_id: rand(giovanni.id..nilton.id)
      )
      puts "Book #{Book.last.id} created!"
    end
  end
end

books_dataset()

puts "Creating reviews..."

puts "Finished seeding the app!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
