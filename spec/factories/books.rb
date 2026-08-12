FactoryBot.define do
  factory :book do
    title { "Test Book" }
    author { "Test Author" }
    category { "Fiction" }
    available { true }
  end

  factory :book_with_faker,parent: :book do
    title{Faker::Book.title}
    author {Faker::Book.author}
  end

end
