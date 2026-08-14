require "rails_helper"

RSpec.describe "Books API", type: :request do
  it "returns a successful response" do
    get "/api/v1/books"

    expect(response).to have_http_status(:ok)
  end

  it "returns books in the response" do
    book = create(:book)

    get "/api/v1/books"

    expect(response).to have_http_status(:ok)

    books = JSON.parse(response.body)

    expect(books).not_to be_empty
  end

  it "creates a book" do
    user = create(:user, admin: true)

    payload = {
      user_id: user.id,
      exp: 24.hours.from_now.to_i
    }

    token = JWT.encode(
      payload,
      Rails.application.secret_key_base
    )

    post "/api/v1/books",
    params: {
      book: {
        title: "New Book",
        author: "Test Author",
        category: "Fiction",
        available: true
      }
    },
    headers: {
      "Authorization" => "Bearer #{token}"
    }

    expect(response).to have_http_status(:created)
  end

end