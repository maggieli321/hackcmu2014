class Input < ActiveRecord::Base

	belongs_to :food
	belongs_to :user

	validates_presence_of :user_id, :qualitys
	validates_numericality_of :food_id, :user_id, greater_than: 0, only_integer: true
	validates_date :date, on_or_after: Date.today
	validates_date :exp_date, on_or_after: Date.today, allow_blank: true, allow_nil: true
	validates_inclusion_of :quality, in: %w[Excellent Ok Bad]
	# validates :input_is_not_already_assigned_to_food, on: :create
	validates_presence_of :date, :name, on: :save

	scope :upcoming, -> { where('date >= ?', Date.today) }
	scope :past, -> { where('date <= ?', Date.today)}
  	scope :rot, -> { where('date < ?', Date.today) }
  	scope :chronological, -> { order('date') }

	def expiration_date
		if !num_days.nil?
			return Date.today + num_days
		elsif !exp_date.nil? 
			return exp_date
		else
			case self.quality
			when 0 # bad quality
		    	modifier = 0.33
			when 1 # ok quality
		    	modifier = 0.67
		 	else # excellent quality
		    	modifier = 1.0
		  	end
		  	return Date.today + self.food.shelf_life*modifier
		end
	end

	after_save :send_reminder
    after_update :send_reminder
    before_validation :assign_expiration_date
    before_validation :assign_user

    def assign_expiration_date
    	self.date = :expiration_date
    end

    def assign_user
    	self.user = @user
    end

	def date
		expiration_date
	end


# private
#   def input_is_not_already_assigned_to_food
#     return true if self.food.nil?  || self.input.nil? 
#     unless Input.where(food_id: self.food_id, input_id: self.input_id).to_a.empty?
#       errors.add(:base, "Item is already in system")
#     end
#   end

	def send_reminder
		if Date.today == :expiration_date -1
			ReminderMailer.food_reminder_msg(@user).deliver
      		flash[:notice] = "#{@user.username} has been notified by email." 
      	end
    end

    
end

