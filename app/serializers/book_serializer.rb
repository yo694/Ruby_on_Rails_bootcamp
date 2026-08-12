class BookSerializer
  def initialize(book)
    @book = book
  end

  def as_json
    {
      id: @book.id,
      title: @book.title,
      author: @book.author
    }
  end
end