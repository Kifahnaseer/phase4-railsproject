class UserMailer < ApplicationMailer
    default from:'comradetreat@gmail.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to Your Favourite Restaurant')
    end

    def password_reset(user)
        @user = user
        @url = edit_password_reset_url(user.reset_token)
        mail(to: user.email, subject: "Password reset")
    end
end
