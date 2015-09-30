class AddCompletedAtToTodoListItems < ActiveRecord::Migration
  def change
  	add_column :todo_items,:completed_at, :datetime
  end
end
