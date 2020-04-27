class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase) 
        if user && user.authenticate(params[:session][:password])
            log_in user
            remember user
            flash[:success] = 'User logged in'
            redirect_to user 
        else
            flash.now[:danger] = 'Invalid email/password'
            render 'new'
        end
    end

    def destroy 
        log_out if logged_in?
        flash[:success] = "Logged out successfuly"
        redirect_to root_url
    end
end
