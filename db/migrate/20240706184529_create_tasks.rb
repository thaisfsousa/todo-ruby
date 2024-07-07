# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed, default: false
      t.references :todo, foreign_key: true, null: false

      t.timestamps
    end
  end
end
