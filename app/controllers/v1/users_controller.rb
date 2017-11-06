class V1::UsersController < ApplicationController
	skip_before_filter :authenticate_request, :only => [:create]

  	def create
  	  if((User.find_by email: user_params[:email]) != nil)
  	  	render json: { status: 'The email is already in use' }, status: :bad_request
  	  else
  		user = User.new(user_params)
		if user.save
		  render json: {status: 'User created successfully'}, status: :created
		else
		  render json: { errors: user.errors.full_messages }, status: :bad_request
		end
  	  end
	end

	private

	def user_params
	  params.permit(:name, :surname, :born_date, :email, :password, :password_confirmation)
	end
end
