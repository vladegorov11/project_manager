class DepartmentPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @department = model
  end

  def index?
    department_editor 
  end

  def show?
    department_editor
  end

  def create?
    department_editor
  end

  def update?
   department_editor
  end

  def edit?
  	department_editor
  end

  def destroy?
    department_editor
  end

  def new?
    department_editor
  end
  def department_editor
    @user.admin? or @user.department_head?
  end

end