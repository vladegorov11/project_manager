class AddNewTaskToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :new_task, :boolean, default: true
  end
end
