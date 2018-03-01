class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  def index
    @teams = Team.all
    authorize @teams
  end

  def show
    authorize @team
    @tasks = @team.tasks.order_update
  end

  def new
    @team = Team.new
    authorize @team
  end

  def my_team
    @team = Team.find(current_user.team_id)
  end

  def edit
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @team.author_id = current_user.profile.id
    authorize @team
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, success: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @team
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, success: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @team
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, success: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description)
    end


end
