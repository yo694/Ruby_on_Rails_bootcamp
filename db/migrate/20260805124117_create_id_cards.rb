class CreateIdCards < ActiveRecord::Migration[7.1]
  def change
    create_table :id_cards do |t|
      t.string :card_number
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
