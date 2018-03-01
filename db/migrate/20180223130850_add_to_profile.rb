class AddToProfile < ActiveRecord::Migration[5.1]
  def change
  	add_column :profiles, :phone, :string
  	add_column :profiles, :skill, :text
  end
end
