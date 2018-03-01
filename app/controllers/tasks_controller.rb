class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :done, :performed, :remake ]
  before_action :set_team, except: [:index]

  # def index
  #   @team = Team.find(params[:team_id])
  #   @tasks = @team.tasks
  # end

  def show
    authorize @task
    task_viewed(@task) if @task.new_task
  end

  def new
    @task = Task.new
  end

  def edit
    authorize @task
  end

  def create
    @task = @team.tasks.build(task_params)
    authorize @task
    respond_to do |format|
      if @task.save
        format.html { redirect_to team_url(@team), success: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, success: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@task = @team.tasks.find(params[:id])
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @team, success: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def performed
    authorize @task
    @task.performed 
    flash[:success] = "Вы начали выполнять задание"
    redirect_to request.referrer
  end

  def done
    authorize @task
    @task.done 
    flash[:success] = "Задание отмечеро как выполненое"
    redirect_to request.referrer
  end
  def remake
    authorize @task
    @task.remake
    flash[:success] = "Задание отмечеро как неправельно сделаное "
    redirect_to request.referrer
  end
  private

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :profile_id )
    end

    def task_viewed task
      task.update(new_task: false) if current_user.profile.id == task.profile_id
    end
end