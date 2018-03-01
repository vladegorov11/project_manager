class Team < ApplicationRecord

	has_many :profiles
	has_many :tasks, dependent: :destroy 
	#after_commit :set_author

	# def set_author
	# 	self.update(author_id: current_user.profile.id)
	# end

end
