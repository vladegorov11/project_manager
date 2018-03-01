class AddDoneTaskCountToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :done_task_count, :integer, default: 0
  end
end
