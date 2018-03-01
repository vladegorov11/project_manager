class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :check_blank_profile
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :danger, :success, :info
  private

    def user_not_authorized
      redirect_to(request.referrer || root_path)
      flash[:danger] = "Вы не уполномочены выполнять это действие."
    end

    def check_blank_profile
	  	if user_signed_in?
        if current_user.profile.last_name.blank? &&  current_user.profile.first_name.blank?
	  		   redirect_to  edit_profile_path(current_user.profile), danger: "Заполните поля имя и фамилия "
        end   
	  	end		
  	end

end
