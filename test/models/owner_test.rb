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

  # Test Validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_presence_of(:phone)

  # Test Scopes
  # create and destroy a context 

  context "Creating three owners" do
    # create the objects I want with factories
    setup do # this setup method is wehere the context gets created. 
      create_owners
    end
    
    # and provide a teardown method as well
    teardown do
      destroy_owners
    end
    
    should "show that all factories are properly created" do
      assert_equal "Alex", @alex.first_name
      assert_equal "Mark", @mark.first_name
      assert_equal "Rachel", @rachel.first_name
      assert @alex.active
      assert @mark.active
      assert_not @rachel.active
    end
    
    # test the scope 'alphabetical'
    should "show that there are three owners in in alphabetical order" do
      assert_equal ["Alex", "Mark", "Rachel"], Owner.alphabetical.map{|o| o.first_name}
    end
    
    # test the scope 'active'
    should "show that there are two active owners" do
      assert_equal 2, Owner.active.size
      # assert_equal ["Alex", "Mark"], Owner.active.alphabetical. map{|o| o.first_name}
      assert_equal ["Alex", "Mark"], Owner.active.map{|o| o.first_name}.sort
    end

        # test the method 'name' works
        should "show that name method works" do
          assert_equal "Heimann, Alex", @alex.name
        end

        # test the callback is working 'reformat_phone'
    # should "shows that Mark's phone is stripped of non-digits" do
    #   assert_equal "4122688211", @mark.phone
    # end

  end



  # Test Callbacks


end
