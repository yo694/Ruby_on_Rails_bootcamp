class AddStockToBooks < ActiveRecord::Migration[7.1]

  def up
    add_column :books, :stock, :integer
  end

  def down
    remove_column :books, :stock
  end

end