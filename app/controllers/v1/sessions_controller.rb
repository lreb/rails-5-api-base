class V1::SessionsController < ApplicationController
  skip_before_filter :authenticate_request, :only => [:create]
  #skip_before_action :authenticate_user!, raise: false

  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success? 
      render json: { auth_token: command.result } 
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
