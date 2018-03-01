class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  has_one :profile, dependent: :destroy  
  has_and_belongs_to_many  :roles
  after_invitation_accepted :create_profile_for_user, :default_role 

  def create_profile_for_user  
		Profile.create(user_id: self.id, email: self.email)                   
  end
  
  def default_role
    self.roles.push(Role.where(name: "Admin"))                 
  end

  def after_confirmation
    create_profile_for_user
    default_role
  end

  def show_profile_including_wage?
    self.admin? or self.office_head?  or self.department_head?
  end
  def admin?
  	check_role(self, "Admin")
  end

  def user? 
  	check_role(self, "User")
  end

  def office_manager? 
    check_role(self, "Office manager")
  end

  def human_resource_manager? 
    check_role(self, "Human resource manager")
  end

  def project_manager? 
    check_role(self, "Project manager")
  end

  def team_lead? 
    check_role(self, "Team lead")
  end

  def department_head? 
    check_role(self, "Department head")
  end

  def office_head? 
    check_role(self, "Office head")
  end

  def system_admin? 
    check_role(self, "System admin")
  end

	private 

	def check_role(user, role_name)
    user.roles.map(&:name).include?(role_name)
	end

end


