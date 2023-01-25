class Api::V1::BooksController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_book, only: %i[show update]

  def index
    @books = policy_scope(Book)
    # @books = Book.all
  end

  def show
  end

  def update
    if @book.update(book_params)
      render :show
    else
      render_error
    end
  end

  def create
    Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      render:show
    else
      render_error
    end

  end
  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:id, :title, :author, :publisher, :year, :category, :description, :isbn, :pages, :image_url, :book_url, :rating)
  end

  def render_error
    render json: { errors: @book.errors.full_messages },
    status: :unprocessable_entity
  end
end
