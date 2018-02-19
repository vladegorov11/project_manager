class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
	before_action :authenticate_user!

	def edit
    authorize @user
 	end

 	def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user.profile, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( { role_ids:[] })
  end

end