class AddConstraintsToBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :author, false
  end
end