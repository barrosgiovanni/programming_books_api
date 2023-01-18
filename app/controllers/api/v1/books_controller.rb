class Api::V1::BooksController < Api::V1::BaseController
  def index
    @books = policy_scope(Book)
    # @books = Book.all
  end
end
