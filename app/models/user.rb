class User < ActiveRecord::Base
	has_secure_password

	has_many :foods, through: :inputs
	has_many :inputs

	validates_presence_of :username, :password, :email
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

	def self.authenticate(username,password)
    	find_by_username(username).try(:authenticate, password)
  	end
end
