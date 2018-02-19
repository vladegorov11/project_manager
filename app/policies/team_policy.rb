class TeamPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @team = model
  end

  def index?
    @user
  end

  def show?
    @user
  end

  def create?
    @user.admin? or @user.team_lead? 
  end

  def new?
    @user.admin? or @user.team_lead? 
  end

  def update?
    @user.admin? or @user.id == @team.author_id
  end

  def edit?
  	@user.admin? or @user.id == @team.author_id
  end

  def destroy?
    @user.admin? or @user.id == @team.author_id
  end
end