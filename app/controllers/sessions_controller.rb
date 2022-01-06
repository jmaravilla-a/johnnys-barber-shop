class SessionsController < ApplicationController
    skip_before_action :authorize_user, only: [:create]

    def create

      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:id] = user.id 
        render json: user, status: :ok
      else 
        render json: "Invalid Credentials. Try again!", status: :unauthorized 
      end
    end

    def destroy
      session.delete :id
    end
    
end
  