# Programming Book API v1

Welcome to Programming Books API!

## Overview:

Programming Books API is a project developed with a educational purpose in mind. The motivation to build this API came from the idea of learning how we could create and maintain an API derived from a Rails app.

Programming Books API offers its users the opportunity to search through a rich database of books that are available on EPUB format and are related to the currently most used programming languages. 

Once signed in, the user is able to access one of the API's endpoint and apply some basic CRUD actions (create, read, update, delete) on its records.

In Programming Books, you are able to:

- create a book or review record in the database;
- read and fetch data from all books present in database;
- read and fetch data from a specific book, including details and its reviews;
- update data related to a book or a review you've created;
- delete a book or review you've created.

## The initial database:

The initial database derives from Google Books API on a filtered search that was applied to retrieve records of books containing a programming language in its title and description and also available on EPUB format.

The data received from GoogleBooks API was then refined to display the most important information of the books and discard fields that were more technical and not so useful at the end.

Thus, a book record contains fields such as the ones below:

{
  title: 
  author: 
  publisher: 
  year:
  category: 
  description: 
  isbn:
  pages: 
  image_url: 
  book_url:
  rating:
}


...
....
.....
......
