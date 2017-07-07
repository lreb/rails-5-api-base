class AuthorizeApiRequest 
	prepend SimpleCommand 
	def initialize(headers = {}) 
		@headers = headers 
	end 
	def call 
		user 
	end 

	private 

	attr_reader :headers 

	def user 
		@user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token 
		@user || errors.add(:token, 'Invalid token') && nil 
	end 

	# decodes the token received from http_auth_headerand 
	def decoded_auth_token 
		@decoded_auth_token ||= JsonWebToken.decode(http_auth_header) 
	end 

	# extracts the token from the authorization header received in the initialization of the class
	def http_auth_header 
		if headers['Authorization'].present?
			if headers['Authorization'].split(' ').first.eql? "Bearer"
				return headers['Authorization'].split(' ').last 
			end
		else 
			errors.add(:token, 'Missing token') 
		end 
		nil 
	end 
end