class AddDepartmentIdToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :department_id, :integer
  end
end
