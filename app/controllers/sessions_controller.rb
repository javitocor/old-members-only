class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase) 
        if user && user.authenticate(params[:session][:password])
            log_in user
            flash.now[:success] = 'User logged in'
            redirect_to user 
        else
            flash.now[:danger] = 'Invalid email/password'
            render 'new'
        end
    end

    def destroy 
        log_out (user)
    end
end
