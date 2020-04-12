class ApplicationController < ActionController::Base    
       
 
    # Having discussed how to store the user's id in a cookie for later use, 
    # we now need to learn how to retrieve the user on subsequent page views.
    # The purpose of current_user, accessible in both controllers and views, 
    # is to allow constructions such as

        # <%= current_user.name %>
        # and
        # redirect_to current_user
    def current_user
        # My own definition is that ||= "double-pipe equals" is an operator that assigns a value, 
        # much like = or our classic assignment operator, but will only 
        # complete the assignment if the left side of our operation returns false or nil
        # but what if someone is not logged in yet?  this would raise an error.
        #  a ruby example:
        # a=nil 
        # b=4
        # a||=b
        # a # 4

        # c=9
        # c||=b
        # c #9
        
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user


    def logged_in?
        current_user
    end
    helper_method :logged_in?

    
    def check_login 
        redirect_to login_path, alert: "You need to log in to view this page." if current_user.nil?
    end

end
  