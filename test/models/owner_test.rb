require 'test_helper'

class OwnerTest < ActiveSupport::TestCase

  #  test "the truth" do
  #   assert true
  #  end

  # We use a library called shoulda-matchers to test validations and associations. 
  # shoulda-matchers provides matchers for writing single line tests for common Rails functionality.
  
  # Test Relationships
  should have_many(:pets)
  should have_many(:visits).through(:pets)

  # # Test Validations
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


  
  #  create and destroy a context

  context "Creating three owners" do

    setup {create_owners}
    
    teardown do
      destroy_owners
    end

    should "show that all factories are properly created" do
      assert_equal("Alex", @alex.first_name)
      assert_equal "Mark", @mark.first_name
      assert_equal "Heimann", @alex.last_name
      assert_not @rachel.active
    end

    should "show that there are three owners in alphabetical order" do
      assert_equal ["Alex", "Mark", "Rachel"], Owner.alphabetical.map{|o| o.first_name}
    end

    should "show that there are only 2 atcive owners" do
      assert_equal 2, Owner.active.size
    end


    should "show that name method works" do
      assert_equal "Heimann, Alex", @alex.name
    end

  end


 
  







  # Test Scopes
  


  # Test Callbacks


end
