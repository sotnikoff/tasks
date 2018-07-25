class AddForeignKeysToTasks < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tasks, :users, column: :author_id
    add_foreign_key :tasks, :users, column: :assigned_to_id
  end
end
