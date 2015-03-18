class Exercise < ActiveRecord::Base
	belongs_to :user
	actable
end
