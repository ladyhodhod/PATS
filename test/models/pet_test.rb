require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Start by using ActiveRecord macros
  # Relationship macros...
  # should belong_to(:owner)
  # should belong_to(:animal)
  # should have_many(:visits)
  
  # Validation macros...
  should validate_presence_of(:name)
  # should "be valid with valid attributes" do
  #   pet = Pet.new(name: 'MacDonald',  owner_id: 1, animal_id: 1)
  #   assert pet.valid?
  # end
  

  
# ---------------------------------
  # Testing other methods with a context
  context "Given context" do
    # create the objects I want with factories
    setup do 
      create_animals
      create_owners
      create_pets
    end
  end
  
end
