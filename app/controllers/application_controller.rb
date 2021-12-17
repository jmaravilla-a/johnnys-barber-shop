class ApplicationController < ActionController::Base
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    before_action :authorize_user

    private 

    def current_user
        @current_user = User.find_by_id(session[:id])
    end

    def logged_in? 
        !!current_user
    end

    def authorize_user 
        render json: {message: "Please Log In"} unless logged_in?
    end

    def record_not_found(errors)
        render json: errors.message, status: :not_found
    end

    def invalid_record(invalid)
        render json: invalid.record.errors, status: :unprocessable_entity
    end
end
