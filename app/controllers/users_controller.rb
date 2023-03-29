class UsersController < ApplicationController

#     before_action :allow_cors

# def allow_cors
#   headers['Access-Control-Allow-Origin'] = '*'
#   headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
#   headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
# end



    def index
        render json: User.all, status: :ok
    end
    
    def signup
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id  
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { message: 'Login successful.' }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password)
    end
end
