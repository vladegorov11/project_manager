class HomeController < ApplicationController
	def index
		redirect_to current_user.profile  if user_signed_in? 
	end
end