class TeamPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @team = model
  end

  def index?
    @user.admin? or @user.team_lead?
  end

  def show?
    @user.admin?  or @user.profile.team_id == @team.id or @user.profile.id == @team.author_id
  end

  def create?
    @user.admin? or @user.team_lead? 
  end

  def new?
    @user.admin? or @user.team_lead? 
  end

  def update?
    @user.admin? or @user.profile.id == @team.author_id
  end

  def edit?
  	@user.admin? or @user.profile.id == @team.author_id
  end

  def destroy?
    @user.admin? or @user.profile.id == @team.author_id
  end

end