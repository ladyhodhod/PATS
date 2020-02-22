require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:pets)
  should have_many(:visits).through(:pets)

  # Validation macros...
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_presence_of(:phone)

  # Validating email...
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)

  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

   # Validating phone...
   should allow_value("4122683259").for(:phone)
   should allow_value("412-268-3259").for(:phone)
   should allow_value("412.268.3259").for(:phone)
   should allow_value("(412) 268-3259").for(:phone)
   
   should_not allow_value("2683259").for(:phone)
   should_not allow_value("4122683259x224").for(:phone)
   should_not allow_value("800-EAT-FOOD").for(:phone)
   should_not allow_value("412/268/3259").for(:phone)
   should_not allow_value("412-2683-259").for(:phone)

   # Validating zip...
  should allow_value("13431").for(:zip)
  should allow_value("15217").for(:zip)
  should allow_value("15090").for(:zip)
  
  should_not allow_value("fred").for(:zip)
  should_not allow_value("3431").for(:zip)
  should_not allow_value("152139843").for(:zip)
  should_not allow_value("15d32").for(:zip)
   

  # ---------------------------------
  # There are some parts that are difficult to test with just matchers 
  # above such  as scopes, and some custom validations. 
  # this is when we think of Contexts. 
  # a Context is an intial set of conditions, that we want our system to have. 
  # In this particular case, my context just creates some owners.

  # Testing other methods with a context
  context "Creating three owners" do
    # create the objects I want with factories
    setup do # this setup method is wehere the context gets created. 
      create_owners
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_owners
    end

      # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "Alex", @alex.first_name
      assert_equal "Mark", @mark.first_name
      assert_equal "Rachel", @rachel.first_name
    #   assert @alex.active
    #   assert @mark.active
    #   deny @rachel.active
    end
  end
end
