class AuthenticateUser 
	prepend SimpleCommand 

	def initialize(email, password) 
		puts password
		@email = email 
		@password = password 
		puts
	end 

	def call 
		JsonWebToken.encode(
			user_id: user.id 
			#name: "#{user.name} #{user.last_name}",
			#profile: user.profile_picture,
			#has_photo: user.profile_picture.blank? ? false : true,
			#role: user.role.blank? ? "" : user.role.ability_name,
  			#admin: user.admin
			) if user 
	end 

	private 

	attr_accessor :email, :password 

	def user
	puts "user method"
	puts password 
		user = User.find_by_email(email)
		return user if user&.valid_password?(password) #user && user.authenticate(password) 
		errors.add :user_authentication, 'invalid credentials' 
		nil 
	end 
end