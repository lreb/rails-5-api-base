class JsonWebToken 
	class << self 
		# takes three parameters -- the user id, the expiration time (1 day), and the unique base key of your Rails application -- to create a unique token
		def encode(payload, exp = 24.year.from_now) 
			payload[:iss] = 'app.facware.com'
			payload[:sub] = 'api rails base'
			payload[:exp] = exp.to_i 
			payload[:aud] = 'facware.com' #to identify the audience, e.g. myapp.com domain
			payload[:iat] = Time.zone.now.to_i #The "iat" (issued at) claim identifies the time at which the JWT was issued.
			
			JWT.encode(payload, Rails.application.secrets.secret_key_base) 
		end 
		# takes the token and uses the application's secret key to decode it
		def decode(token) 
			body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0] 
			HashWithIndifferentAccess.new body 
		rescue 
			nil 
		end 
	end 
end
