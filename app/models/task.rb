class Task < ApplicationRecord
	extend SimplestStatus

	has_many :comments, dependent: :destroy 
	belongs_to :team
	belongs_to :profile

	after_destroy :done_task_count
  statuses :created, :performed, :done, :remake
  simple_status :locale, [:english, :spanish, :russian]

  def done_task_count
  	if self.status == 2 
  		Profile.find(self.profile_id).increment(:done_task_count).save  unless self.profile_id.nil?
  	end
  end

end