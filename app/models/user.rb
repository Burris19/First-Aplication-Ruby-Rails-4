class User < ActiveRecord::Base

	has_may :posts

	validates :nombre, presence: true #, length: { maximum: 5 }

	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true #, format: { with:VALID_EMAIL_REGEX}

	has_secure_password
	validates :password, length: { minimum: 6 }
end
