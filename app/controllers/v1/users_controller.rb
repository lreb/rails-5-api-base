class V1::UsersController < ApplicationController
  	def create
  		puts "params"
  		puts user_params[:email]
  		puts user_params[:password]
	  user = User.new(user_params)

	  if user.save
	    render json: {status: 'User created successfully'}, status: :created
	  else
	    render json: { errors: user.errors.full_messages }, status: :bad_request
	  end
	end

	private

	def user_params
	  params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
