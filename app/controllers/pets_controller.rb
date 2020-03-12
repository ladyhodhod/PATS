class PetsController < ApplicationController

    # Get /pets --> pets#index
    # The request gets sent to the index method of the PetsController class.
    # The controller is responsible for handling the browser requests.
    # It controls the model and the view to generate a response.
    # The controller receives the request, 
    # loads the requested data via the model usually from a database.
    # And then inserts that data into the view, which is usually an HTML page.
    # The result of rendering the HTML is then returned to the browser as a response.

    # The index method or action
    def index 
        # First, we call Pet.all method to load all pet objects and
        # store them in an instance variable
        @pets=Pet.active.alphabetical
        # Then the controller uses the data to render a view
        # By default, it renders a template with the same name as the action
        # we could add an explicit call to the render method and get the same result
        # the next line is not mandatory, it is done by default in every rails app
        render template: "pets/index.html.erb", layout:"application"
        # render the index.html.erb and give it access to @pets content
    end

end
