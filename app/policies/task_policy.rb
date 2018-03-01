class TaskPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @task = model
  end

  def show?
    @user.admin? or user_author? or @user.profile.id == @task.profile_id
  end

  def create?
    @user.admin?  or user_author?
  end

  def new?
    @user.admin? or @user.team_lead? or user_author?
  end

  def update?
    @user.admin?  or user_author?
  end

  def edit?
  	@user.admin?  or user_author?
  end

  def destroy?
    @user.admin?  or user_author?
  end

  def performed?
    @user.admin? or user_author? or @user.profile.id == @task.profile_id
  end

  def done?
    @user.admin? or user_author? or @user.profile.id == @task.profile_id
  end

  def remake?
    @user.admin? or user_author?
  end

  private 

  def user_author?
    @user.profile.id == Team.find(@task.team_id).author_id
  end

end