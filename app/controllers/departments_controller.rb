class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
    authorize @departments
  end

  def show
    @profiles = @department.profiles
    authorize @department
  end


  def new
    @department = Department.new
    authorize @department
  end

  def edit
    authorize @department
  end

  def create
    @department = Department.new(department_params)
    authorize @department
    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, success: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @department
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, success: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @department
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, success: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name)
    end
end
