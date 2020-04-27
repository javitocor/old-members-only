module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
        current_user        
    end
    
    
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        forget current_user
        @current_user = nil
    end


    def remember (user)
        user.update_attribute(:remember_token, Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s))
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.update_attribute(:remember_token, nil)
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
