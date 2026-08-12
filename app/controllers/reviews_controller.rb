class ReviewsController < ApplicationController

  def index
    render plain: "Reviews for Book ID #{params[:book_id]}"
  end

end