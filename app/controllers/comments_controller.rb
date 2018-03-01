class CommentsController < ApplicationController
  before_action :set_team_and_task

	def create
    @comment = @task.comments.create(comment_params)
    authorize @comment
    redirect_to team_task_path(@team, @task), info: 'Комментарий добавлен'
  end

  def destroy
    @comment = @task.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to team_task_path(@team, @task), info: 'Комментарий удален'
  end
 
  private

  def set_team_and_task
    @team = Team.find(params[:team_id])
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:author_id, :body)
  end

end
