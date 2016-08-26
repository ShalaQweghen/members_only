class User < ApplicationRecord
	attr_accessor :remember_token
	has_many :posts
	has_secure_password
	before_create :digest_token

	def User.digest(string)
		Digest::SHA1.hexdigest(string)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_token.nil?
		remember_digest == Digest::SHA1.hexdigest(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end