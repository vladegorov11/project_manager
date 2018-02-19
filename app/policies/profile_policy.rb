
class ProfilePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @profile = model
  end

  def index?
    @user
  end

  def show?
		check_user_role or @user.id == @profile.user_id
  end

  def update?
    edit_profile 
  end

  def edit?
  	edit_profile 
  end
  
  def invitation_user?
    @user.admin? or @user.human_resource_manager? 
  end



  def permitted_attributes
	  if @user.admin? or @user.id == @profile.user_id
	    [:first_name, :last_name, :wage, :department_id, :team_id, :image]
	  elsif @user.human_resource_manager?
	    [:first_name, :last_name, :wage]
	  elsif @user.team_lead? 
	  	[:team_id]
	  elsif @user.department_head? 
	  	[:department_id]
	  end
	end  

	def check_user_role
		present = false 
		show_all_profile.each do |role|
			present = true if @user.roles.map(&:name).include?(role) 
		end
		present 
	end

  private 

  def edit_profile 
    @user.admin? or @user.id == @profile.user_id or @user.human_resource_manager? or @user.team_lead? or @user.department_head? 
  end

  def show_all_profile
    ["Office manager", "Project manager", "Team lead", "Admin", "Human resource manager", "Department head"]
  end

end