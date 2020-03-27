require "test_helper"

# Calling the REST methods and making they work
class PetsControllerTest < ActionDispatch::IntegrationTest
    
    setup do
        @animal = FactoryBot.create(:animal)
        @owner  = FactoryBot.create(:owner)
        @pet    = FactoryBot.create(:pet, owner: @owner, animal: @animal)
    end

    test "should get index" do
        get pets_path 
        assert_response :success
    end

    test "should get new" do
        get new_pet_path # as if I am typing /pets/new in the browser
        assert_response :success
    end

    test "should show pet" do
        get pet_path(@pet) #generate this url /pet/@pet.id
        assert_response :success
    end

    test "should edit pet" do
        get edit_pet_path(@pet)
        assert_response :success
    end

    # This method tests the creation of a pet.
  # It tests the POST request
  test "should create pet" do
    # Test numeric difference between the return value of an
    # expression as a result of what is evaluated in the yielded block.
    assert_difference('Pet.count', +1) do
      post pets_path, params: { pet: { name: "Honey", animal_id: @animal.id,
      owner_id: @owner.id, female: true, dob: 3.years.ago.to_date, active: true } }
    end
    assert_redirected_to pet_path(Pet.last)

    post pets_path, params: { pet: { name: nil, animal_id: @animal.id, owner_id: @owner.id,
      female: true, dob: 3.years.ago.to_date, active: true } }
    assert_template :new
  end

  test "should update pet" do
    patch pet_path(@pet), params: { pet: { name: "Honey", animal_id: @pet.animal.id, owner_id: @pet.owner.id, female: true, dob: @pet.dob, active: true } }
    assert_redirected_to pet_path(@pet)

    patch pet_path(@pet), params: { pet: { name: nil, animal_id: @pet.animal.id, owner_id: @pet.owner.id, female: true, dob: @pet.dob, active: true } }
    assert_template :edit
  end


  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_path(@pet)
    end
    assert_redirected_to pets_path
  end


end
