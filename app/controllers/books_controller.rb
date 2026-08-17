class BooksController < ApplicationController

  before_action :check_login
  before_action :find_book, only: [:show, :edit, :update, :destroy, :publish]
  before_action :authenticate_user!

  def index
    puts "Logged in user: #{current_user.email}"
    puts user_signed_in?
    @books = [
      {
        title: "Ruby on Rails",
        author: "Yogitha",
        category: "Programming",
        available: true
      }
    ]
  end

  def show
  end

  def new
    @book = Book.new
    @book.reviews.build
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Book added successfully."
          redirect_to books_path
        end
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    flash[:notice] = "Book updated successfully."

    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    
    @book.destroy
    flash[:alert] = "Book deleted."
    redirect_to books_path
  end

  def publish
    render plain: "Book Published Successfully."
  end

  def search
    render plain: "Searching Books..."
  end

  def query_demo
    @all_books = Book.all
    @book_by_id = Book.find(1)
    @book_by_title = Book.find_by(title: "Ruby on Rails")
    @available_books = Book.where(available: true)
    @book_titles = Book.pluck(:title)
    @book_ids = Book.ids
    render plain: {
      all_books: @all_books,
      book_by_id: @book_by_id,
      book_by_title: @book_by_title,
      available_books: @available_books,
      book_titles: @book_titles,
      book_ids: @book_ids
    }.inspect
  end

  def stimulus_demo
  end

  def http_cache_demo
    @books = Book.all
    fresh_when etag: @books
  end
    

  private

  def check_login
    puts "Checking Login..."
  end

  def find_book
    @book = {
      id: params[:id],
      title: "Ruby on Rails",
      author: "Yogitha"
    }
  end

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :category,
      :available,
      :ebook_available,
      reviews_attributes: [
        :rating,
        :comment
      ]
    )
  end

  def books_with_reviews
    @books = Book.includes(:reviews)
  end
  
  
end