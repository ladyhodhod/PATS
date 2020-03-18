class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
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
        @pets=Pet.active.alphabetical.paginate(:page => params[:page]).per_page(3)
        # Then the controller uses the data to render a view
        # By default, it renders a template with the same name as the action
        # we could add an explicit call to the render method and get the same result
        # the next line is not mandatory, it is done by default in every rails app
        # render template: "pets/index.html.erb", layout:"application"
        # render the index.html.erb and give it access to @pets content
    end

    # GET /pets/1
    # GET /pets/1.json
    def show
      # @pet= Pet.find(params[:id]) # covered by the callback before_action
        # render template: "pets/show.html.erb", layout:"application"
    end

    # this sets up a new html form for a new Pet object
    # GET /pets/new
    def new
        @pet= Pet.new
        render template: "pets/new.html.erb", layout:"application"

    end

    # POST /pets
    # POST /pets.json
    # def create
    #     @pet= Pet.new(pets_params)
    #     if @pet.save
    #         redirect_to @pet
    #     end
    # end

    def create
        @pet = Pet.new(pets_params)
          if @pet.save #Pet successfully saved
            # Call redirect_to to send an HTTP redirect status code to the browser
            # redirects to the show page for the newly created Pet
            redirect_to pet_path(@pet), notice: "#{@pet.name} was successfully created."
          else #Pet is not saved!
            render action: 'new' 
          end
      end

    # GET /pets/1/edit
    def edit 
      # @pet= Pet.find(params[:id]) # this is done in the callback
        # render template: "pets/edit.html.erb", layout:"application"
    end

    # PATCH/PUT /pets/1
    # PATCH/PUT /pets/1.json
    def update
            # Use the filtered parameters to update
            # the existing model record.
          if @pet.update(pets_params)
            # # Redirect the browser to another location
            # so that it doesn't just sit there displaying
            # the submitted form.
              redirect_to pet_path(@pet), notice: "#{@pet.name} was successfully updated."
          else
            render action: 'edit' 
          end
      end


    # DELETE /pets/1
     # DELETE /pets/1.json
     def destroy
      @pet.destroy
      redirect_to pets_url
    end

    private
    def set_pet
      @pet= Pet.find(params[:id])
    end

    # Strong parameters method
    def pets_params
        params.require(:pet).permit(:name, :dob, :female, :active, :animal_id, :owner_id)
    end

   
end
