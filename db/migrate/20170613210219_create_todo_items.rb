class CreateTodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.text :description, null: false
      t.boolean :priority, default = false
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
