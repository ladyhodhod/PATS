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

    def search
        # store the value of the key term in the @query instance variable
        @query = params[:term]
        
        # search for all the owners in the system by either first or last name
        @owners_found = Owner.search(@query) # using the search scope defined for the Owner model
       
        # search for all pets that have a name like some term
        @pets_found = Pet.search(@query) # using the search scope defined for the Pet model
       
        # Store the number of records found to be displayed to the user
        @total_hits = @owners_found.length + @pets_found.length

        # implicitely
        # render template:'search.html.erb', layout:"application.html.erb"
    end

   
end
