class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.references :todo_list, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
