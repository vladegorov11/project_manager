class Profile < ApplicationRecord
	
	mount_uploader 	:image, ImageUploader
	belongs_to      :user, dependent: :destroy 
	belongs_to      :department, optional: true
	belongs_to      :team, optional: true
	has_many 		:tasks
	validates :first_name, presence: true, allow_nil: true
	validates :last_name, presence: true, allow_nil: true
	validates :phone, format: { with: /\+([\d]){3}([\d]){9}/,
    message: "Введите телефон в формате: +380997360055" }, allow_nil: true
    
end
