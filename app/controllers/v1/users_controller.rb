class V1::UsersController < ApplicationController
	skip_before_filter :authenticate_request, :only => [:create]

  	def create
  		puts "params"
  		puts user_params[:email]
  		puts user_params[:password]
  		
	  user = User.new(user_params)
	  puts user.to_json
	  if user.save
	    render json: {status: 'User created successfully'}, status: :created
	  else
	    render json: { errors: user.errors.full_messages }, status: :bad_request
	  end
	end

	private

	def user_params
	  params.require(:user).permit(:name, :surname, :born_date, :email, :password)
	end
end
