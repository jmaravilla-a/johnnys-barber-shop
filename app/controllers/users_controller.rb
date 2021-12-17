class UsersController < ApplicationController
    skip_before_action :authorized, only: [:show, :create]

    def show 
        user = User.all.find_by!(@current_user)
        render json: teacher, status: :ok
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
