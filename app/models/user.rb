class User < ActiveRecord::Base
	
	#has_secure_password

	has_and_belongs_to_many :books

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :first_name, 	:presence => true
	validates :last_name, 	:presence => true
	validates :username, 		:length => {:within => 4..25},
													:uniqueness => true
	validates :email,				:presence => true,
													:length => {:maximum => 75},
													:format => EMAIL_REGEX,
													:uniqueness => true
	validates :password, 		:presence => true,
													:length => {:within => 6..30},
													:confirmation => true

	def full_name
		"#{first_name} #{last_name}"
	end
end
