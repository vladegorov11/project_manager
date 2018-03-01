class AddStatusToTask < ActiveRecord::Migration[5.1]
  def change
  	add_column :tasks, :status, :integer, :null => false, :default => 0
    add_column :tasks, :locale, :integer, :null => false, :default => 0
  end
end
