module TeamsHelper

	def show_task (task, user)
		user.admin? or user.team_lead? or user.profile.id == task.profile_id
	end

end
