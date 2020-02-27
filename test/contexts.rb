module Contexts

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

  def create_animals
    @cat    = FactoryBot.create(:animal)
    @dog    = FactoryBot.create(:animal, name: 'Dog')
    @bird   = FactoryBot.create(:animal, name: 'Bird')
    @ferret = FactoryBot.create(:animal, name: 'Ferret')
    @rabbit = FactoryBot.create(:animal, name: 'Rabbit')
    @turtle = FactoryBot.create(:animal, name: 'Turtle', active: false)
  end
  
  def destroy_animals
    @cat.delete  
    @dog.delete
    @bird.delete
    @ferret.delete
    @rabbit.delete
    @turtle.delete
  end


end