class User < ActiveRecord::Base
	# to avoid forbit emails doublons in database
	before_save { self.email = email.downcase }

	validates :name, 
				presence: true, 
				length: { maximum: 50 }

	# regex for email type validation
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, 
				presence: true, 
				format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }

	# to secure to password field
	has_secure_password
	validates :password,
				length: { minimum: 6 }

end
