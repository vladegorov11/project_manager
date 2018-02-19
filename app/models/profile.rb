class Profile < ApplicationRecord
	
	mount_uploader :image, ImageUploader
	belongs_to               :user, dependent: :destroy 
	belongs_to               :department, optional: true
	belongs_to               :team, optional: true

end
