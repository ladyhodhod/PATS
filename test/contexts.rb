# require needed files
# require './test/sets/animals'
# require './test/sets/owners'
# require './test/sets/pets'
# require './test/sets/visits'


module Contexts
  # explicitly include all sets of contexts used for testing 
  # include Contexts::Animals
  # include Contexts::Owners
  # include Contexts::Pets
  # include Contexts::Visits

  
  # def create_all
    # create_animals
    # create_owners
    # create_pets
    # create_visits
  # end
   # FactoryBot uses the factory design pattern
   def create_owners #here is the method
    @alex = FactoryBot.create(:owner) # this creates the default owner Alex.
    @rachel = FactoryBot.create(:owner, first_name: "Rachel", active: false)
    @mark = FactoryBot.create(:owner, first_name: "Mark", phone: "412-268-8211")
  end
  # the following is inefficient, so using FactoryBot makes it more efficient and easier to do.
  # o=Owner.new
  # o.first_name="Rachel"

  def destroy_owners
    @rachel.destroy
    @mark.destroy
    @alex.destroy
  end

  def create_pets
    @dusty = FactoryBot.create(:pet, animal: @cat, owner: @alex, female: false)
    @polo = FactoryBot.create(:pet, animal: @cat, owner: @alex, name: "Polo", active: false)
    @pork_chop = FactoryBot.create(:pet, animal: @dog, owner: @mark, name: "Pork Chop")
  end
  
  def destroy_pets
    @dusty.destroy
    @polo.destroy
    @pork_chop.destroy
  end


end