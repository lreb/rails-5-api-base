class V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request, :only => [:create]

  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success? 
      #return intial data after signup
      render json: { 
        jwt_token: command.result, 
        #user_id: JsonWebToken.decode(command.result)[:user_id],
        #expiration: JsonWebToken.decode(command.result)[:exp],
        } 
    else 
      render json: { error: command.errors }, status: :unauthorized 
    end

    # user = User.find_by(:email => params[:email])
    # if user&.valid_password?(params[:password])
    #   render json: user.as_json(only: [:id, :email]), status: :created
    # else
    #   head(:unauthorized)
    # end
  end

  def destroy
    
  end
end
