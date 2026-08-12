class AddUniqueIndexToAuthorsEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :authors, :email, unique: true
  end
end