class UsersController < ApplicationController
    skip_before_action :authorized, only: :create
    
    def index
        render json: User.all, status: :ok
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id  
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user, status: :ok
    end

    def password_reset
        user = User.find_by_email(params[:email])
        if user
          user.generate_password_reset_token
          user.save!
          UserMailer.password_reset(user).deliver_now
          render json: { message: "Password reset instructions sent to #{user.email}" }, status: :ok
        else
          render json: { error: "User with email #{params[:email]} not found" }, status: :not_found
        end
    end

    def reset_password
        @user = User.find_by_password_reset_token(params[:token])
        if @user && @user.password_reset_sent_at > 2.hours.ago
          # Render the reset password form
        else
          render json: { error: "Invalid or expired reset password link" }, status: :unprocessable_entity
        end
    end

    def update_password
        @user = User.find_by_password_reset_token(params[:token])
        if @user && @user.password_reset_sent_at > 2.hours.ago
          if @user.update(password: params[:password])
            render json: { message: "Password updated successfully" }, status: :ok
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Invalid or expired reset password link" }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password)
    end
end
