module Api
  module V1
    class BooksController < ApplicationController
      include JwtAuthenticatable

      before_action :authenticate_user_from_token, only: [:create,:destroy]

      skip_before_action :verify_authenticity_token
      #skip_after_action :verify_authorized, only: [:index,:bad_request_demo]

      
      def index
        books = Book.page(params[:page]).per(params[:per_page] || 10).map do |book|
          BookSerializer.new(book).as_json
        end

        render json: books, status: :ok
      end

      def create
        book = Book.new(book_params)

        authorize book
        if book.save
          render json: BookSerializer.new(book).as_json, status: :created
        else
          render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
         book = Book.find(params[:id])
         authorize book
         book.destroy
         head :no_content
        end

        def bad_request_demo
          render json: {error: "Bad request"},status: :bad_request
        end

      private

      def book_params
        params.require(:book).permit(:title, :author, :category, :available)
      end

    end
  end
end