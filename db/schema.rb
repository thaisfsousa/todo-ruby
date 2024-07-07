# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 20_240_706_184_529) do
  create_table 'tasks', force: :cascade do |t|
    t.string 'description'
    t.boolean 'completed', default: false
    t.integer 'todo_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['todo_id'], name: 'index_tasks_on_todo_id'
  end

  create_table 'todos', force: :cascade do |t|
    t.string 'description', null: false
    t.boolean 'completed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'tasks', 'todos'
end
