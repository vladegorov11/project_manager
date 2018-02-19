class CreateRolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_users, id: false do |t|
    	t.integer :role_id
    	t.integer :user_id
    end
  end
end
