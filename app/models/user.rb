class User < ActiveRecord::Base
	has_secure_password

	has_many :foods, through: :inputs
	has_many :inputs

	validates_presence_of :username, :password, :email
	# validates_inclusion_of :role, in: %w[admin, member]
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

	ROLES = [['admin', :admin],['member', :member]]
	
	def role?(authorized_role)
    	return false if role.nil?
    	role.downcase.to_sym == authorized_role
  	end
	def self.authenticate(username,password)
    	find_by_username(username).try(:authenticate, password)
  	end
end
