class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :my_tasks]
  after_action :verify_authorized
  skip_before_action :check_blank_profile , only: [:edit, :update]
  def index
    @profiles = Profile.all
    authorize @profiles
  end


  def show
    authorize @profile
    @tasks = @profile.tasks.order_update.last(4)
    @team = @profile.team
  end

  def my_tasks
    authorize @profile
    if @profile.team_id.nil?
      redirect_to @profile, danger: 'Вы не состоите в команде '
    else   
      @tasks = @profile.tasks
      @task = @tasks.first
      @team = Team.find(@task.team_id)
    end
  end

  def new
    @profile = Profile.new
  end


  def edit
     authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, success: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @profile
    respond_to do |format|
      if @profile.update(permitted_attributes(@profile))
        format.html { redirect_to @profile, success: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def invitation_user
    @users = User.created_by_invite
    authorize Profile
  end
  # def destroy
  #   @profile.destroy
  #   respond_to do |format|
  #     format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end


    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :wage, :department_id, :team_id, :image, :author_id, :phone, :skill)
    end
end
