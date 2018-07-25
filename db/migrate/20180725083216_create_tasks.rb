class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.string :status, null: false, default: 'new'
      t.integer :author_id, null: false, default: 0
      t.integer :assigned_to_id, null: false, default: 0

      t.timestamps
    end
  end
end
