require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
# Not much for testing Animal as it is a simple model
  # Relationship matchers...
  should have_many(:pets)

  # Validation matchers...
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

   # Testing other methods with a context
   context "Creating six animals" do
    # create the objects I want with factories
    setup do # this setup method is wehere the context gets created. 
      create_animals
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_animals
    end
   # now run the tests:
    should "show that all factories are properly created" do
      assert_equal "Dog", @dog.name
      assert_equal "Bird", @bird.name
      assert @dog.active
      assert @bird.active
      assert_not @turtle.active
    end

  # test the scope 'alphabetical'
  should "shows that animals are listed in alphabetical order" do
    assert_equal ["Bird", "Cat", "Dog", "Ferret", "Rabbit", "Turtle"], Animal.alphabetical.map{|a| a.name}
  end

  # test the scope 'active'
  should "shows that there are five active animals" do
    assert_equal 5, Animal.active.size
    # assert_equal ["Alex", "Mark"], Owner.active.alphabetical. map{|o| o.first_name}
    assert_equal ["Bird", "Cat", "Dog", "Ferret", "Rabbit"], Animal.active.map{|a| a.name}.sort
  end

   # test the scope 'inactive'
   should "shows that there is one inactive animal" do
    assert_equal 1, Animal.inactive.size
    # assert_equal ["Alex", "Mark"], Owner.active.alphabetical. map{|o| o.first_name}
    assert_equal ["Turtle"], Animal.inactive.map{|a| a.name}.sort
  end
  end

end
