# This controller is generated using the following command:
# rails generate controller home

class HomeController < ApplicationController

    def index 
    # The following is done implicitely in Rails. 
    # render template:'index.html.erb', layout:'application'
    end


   def about
    # render template:'about.html.erb', layout:'application'
    end

    def contact
    # render template:'contact.html.erb', layout:'application'
    end

    def privacy
        # render template:'privacy.html.erb', layout:'application'
    end

   
end
