class Food < ActiveRecord::Base

	has_many :inputs
	has_many :users, through: :inputs
end
