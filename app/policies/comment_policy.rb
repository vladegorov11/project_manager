class CommentPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @comment = model
  end

  def create?
    @user.admin? or @user.profile.id == find_team.author_id or @user.profile.id == @comment.author_id
  end

  def destroy?
    @user.admin?  or @user.profile.id == @comment.author_id
  end

  private

  def find_team
    Team.find(find_task.team_id)
  end

  def find_task
    Task.find(@comment.task_id)
  end
end