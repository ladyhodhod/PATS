class PetsController < ApplicationController
  # A callback to set up an @pet object to work with 
    before_action :set_pet, only: [:show, :edit, :update, :destroy]

    def index
        @pets = Pet.active
      end

    def show
      @pet=Pet.find(params[:id])
    end

    def new
      @pet = Pet.new
    end
    
    def edit
      @pet=Pet.find(params[:id])
    end
  
    def create
      @pet = Pet.new(pet_params)
      if @pet.save
        redirect_to pet_path(@pet), notice: "Successfully added #{@pet.name} as a PATS pet."
      else
        render action: 'new'
      end
    end
  
    def update
      if @pet.update_attributes(pet_params)
        redirect_to @pet, notice: "Updated #{@pet.name}'s information"
      else
        render action: 'edit'
      end
    end
  
    def destroy
      @pet.destroy
      redirect_to pets_url, notice: "Removed #{@pet.name} from the PATS system"
    end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end
  # Never trust parameters from the scary internet, only allow the white list through.
  #  this is the strong parameters method
  def pet_params
    params.require(:pet).permit(:name, :animal_id, :owner_id, :female, :dob, :active)
  end

end
