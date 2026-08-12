require "rails_helper"

RSpec.describe Book, type: :model do

  it "creates a book successfully" do
    book = create(:book)

    expect(book).to be_valid
    expect(book).to be_persisted
  end

  it "creates a book with fake data" do
    book = create(:book_with_faker)

    puts "Title: #{book.title}"
    puts "Author: #{book.author}"

    expect(book).to be_valid
    expect(book).to be_persisted
  end

end