module Contexts

    # ======= Owners
  def create_owners #here is the method
    @alex = FactoryBot.create(:owner) # this creates the default owner Alex.
    @rachel = FactoryBot.create(:owner, first_name: "Rachel", active: false)
    @mark = FactoryBot.create(:owner, first_name: "Mark", phone: "412-268-8211")
    p @mark.phone
  end
  # the following is inefficient, so using FactoryBot makes it more efficient and easier to do.
  # o=Owner.new
  # o.first_name="Rachel"

  def destroy_owners
    @rachel.destroy
    @mark.destroy
    @alex.destroy
  end

  # ======= Animals
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
  
  # ======= Pets
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

  # ======= Visits
  def create_visits
    @visit1 = FactoryBot.create(:visit, pet: @dusty)
    @visit2 = FactoryBot.create(:visit, pet: @polo, date: 5.months.ago.to_date)
    @visit3 = FactoryBot.create(:visit, pet: @polo, date: 2.months.ago.to_date)    
  end
  
  def destroy_visits
    @visit1.delete
    @visit2.delete
    @visit3.delete
  end


end