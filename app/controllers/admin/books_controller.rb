module Admin

  class BooksController < ApplicationController

    def index
      render plain: "Admin Books Dashboard"
    end

  end

end