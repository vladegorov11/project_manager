class AddAuthorIdToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :author_id, :integer
  end
end
