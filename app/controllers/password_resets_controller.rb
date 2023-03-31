class PasswordResetsController < ApplicationController
    def new
    end

    def create 
        @user = User.find_by(email:params[:email])

        if @user.present?
            #send email
        
        end
    end

end