class AddTeamIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :team_id, :integer
    add_index :tasks, :team_id
  end
end
