class AddProfileIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :profile_id, :integer
  end
end
