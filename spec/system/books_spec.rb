require "rails_helper"

RSpec.describe "Books", type: :system do
  it "displays the books page" do
    visit "/books"

    expect(page).to have_content("Books")
  end

  it "allows an admin to create a book" do
    user = create(:user, admin: true)

    visit "/users/sign_in"

    fill_in "Email", with: user.email
    fill_in "Password",with: "password"

    click_button "Log in"

    visit "/books/new"
    fill_in "Title", with: "System Test Book"
    fill_in "Author", with: "Test Author"
    fill_in "Price", with: 500
    
    select "Programming", from: "Category"
    click_button "Save Book"
    expect(page).to have_content("Book added successfully")
  end
end