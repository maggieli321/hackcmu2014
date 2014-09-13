class Input < ActiveRecord::Base

	belongs_to :food
	belongs_to :user

	validates_presence_of :food_id, :user_id, :date, :name, :quality
	validates_numericality_of :food_id, :user_id, :num_days, greater_than: 0, only_integer: true
	validates_date :date, :exp_date, on_or_after: Date.today
	validates_numericality_of :quality, greater_than_or_equal_to: 0, less_than: 3


end


def date
	return Date.today
end