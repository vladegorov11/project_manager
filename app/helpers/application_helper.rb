module ApplicationHelper
	
	def status_color task
		color_arrey = {0 => "primary", 1 => "warning", 2 =>"success",3 => "danger"}
		color = color_arrey[task.status]
	end

end
