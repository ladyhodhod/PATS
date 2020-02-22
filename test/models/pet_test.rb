require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test ​"pet attributes must not be empty"​​ do​
  ​ 	  pet = Pet.new
  ​ 	  assert pet.invalid?
  ​ 	  assert pet.errors[​:name].any?
  ​ 	  assert pet.errors[​:owner_id].any?
  ​     assert pet.errors[​:animal_id].any?
  end
end
