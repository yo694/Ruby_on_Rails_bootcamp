module Admin

  class BooksController < ApplicationController

    def index
      render plain: "Admin Books Dashboard"
    end

    def books_with_reviews
      @books = Book.includes(:reviews)
    end
  end

end