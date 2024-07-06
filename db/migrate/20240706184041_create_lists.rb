class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.references :parent_list, foreign_key: {to_table: :lists}
      t.timestamps
    end
  end
end
