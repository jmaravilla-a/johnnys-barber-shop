class UsersController < ApplicationController
    skip_before_action :authorize_user, only: [:show, :create]

    def show 
        if @current_user
            render json: teacher, status: :ok
        else
            render json: "Not authorized", status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params)
        if user.valid?
            session[:id] = user.id
            render json: user, status: :created
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
