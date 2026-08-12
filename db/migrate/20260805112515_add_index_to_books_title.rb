class AddIndexToBooksTitle < ActiveRecord::Migration[7.1]
  def change
    add_index :books, :title
  end
end