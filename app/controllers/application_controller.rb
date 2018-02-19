class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  #before_action :check_blank_profile
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      redirect_to(request.referrer || root_path)
      flash[:danger] = "Вы не уполномочены выполнять это действие."
    end

   #  def check_blank_profile
	  # 	if user_signed_in?
	  # 		flash[:notice] = "Заполните профайл" if current_user.profile.last_name.blank? ||  current_user.profile.first_name.blank?
	  # 	end		
  	# end

end
