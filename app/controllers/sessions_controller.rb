class SessionsController < ApplicationController
    skip_before_action :authorized, only: :create



    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { message: 'Login successful.' }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def destroy
        if session.present?
            session.delete :user_id
            head :no_content
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end
end
