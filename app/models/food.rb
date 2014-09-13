class Food < ActiveRecord::Base

	has_many :inputs
	has_many :users, through: :inputs

	validates_numericality_of :shelf_life, greater_than: 0

  	scope :alphabetical, -> { order('name') }

end
