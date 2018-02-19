class AddTeamIdToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :team_id, :integer
  end
end
