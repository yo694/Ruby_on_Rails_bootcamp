class Book < ApplicationRecord
  has_many :reviews
  accepts_nested_attributes_for :reviews

  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :title, presence: true
  validates :author, presence: true

  validates :price,
            presence: true,
            numericality: true,
            if: :ebook_available?

  validate :title_should_not_have_special_characters

  before_save :show_save_message
  after_save :show_after_save_message
  before_create :show_before_create_message
  after_create :show_after_create_message
  before_save :prevent_test_book

  private

  def title_should_not_have_special_characters
    if title.present? && title.match?(/[^a-zA-Z0-9 ]/)
      errors.add(:title, "should not contain special characters")
    end
  end

  def show_save_message
    puts "Book is about to be saved!"
  end
  
  def show_after_save_message
    puts "Book has been saved!"
  end

  def show_before_create_message
    puts "Book is about to be created!"
  end
  
  def show_after_create_message
    puts "Book has been created!"
  end

  def prevent_test_book
     if title == "STOP"
      puts "Save stopped by callback!"
      throw :abort
    end
  end
  
end