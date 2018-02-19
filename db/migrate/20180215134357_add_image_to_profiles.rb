class AddImageToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :image, :json
  end
end
