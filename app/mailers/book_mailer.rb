class BookMailer < ApplicationMailer
  def book_created(book)
    @book = book
    mail(
      to: "user@gmail.com",
      subject: "New Book Created"
    )
  end
end
