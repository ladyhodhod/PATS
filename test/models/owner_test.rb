require 'test_helper'

class OwnerTest < ActiveSupport::TestCase

  #  test "the truth" do
  #   assert true
  #  end

  # We use a library called shoulda-matchers to test validations and associations. 
  # shoulda-matchers provides matchers for writing single line tests for common Rails functionality.
  # more on shoulda: https://github.com/thoughtbot/shoulda
  
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
  should allow_value("30431").for(:zip)
  should allow_value("15217").for(:zip)
  should allow_value("15090").for(:zip)
  
  should_not allow_value("fred").for(:zip)
  should_not allow_value("3431").for(:zip)
  should_not allow_value("152139843").for(:zip)
  should_not allow_value("15d32").for(:zip)
  
  # Validating state...
  should allow_value("PA").for(:state)
  should allow_value("WV").for(:state)
  should allow_value("OH").for(:state)
  should_not allow_value("bad").for(:state)
  should_not allow_value(10).for(:state)
  should_not allow_value("CA").for(:state)
  

   # ---------------------------------
  # There are some parts that are difficult to test with just matchers 
  # above such  as scopes, and some custom validations. 
  # this is when we think of Contexts. 
  # a Context is an intial set of conditions, that we want our system to have. 
  # In this particular case, my context just creates some owners.
    # Testing other methods with a context
  context "Creating three owners" do
    # create the objects I want with factories
    setup do
      create_owners # this setup method is wehere the context gets created.
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
      assert @alex.active
      assert @mark.active
      assert !@rachel.active
    end

    # test the scope 'alphabetical'
    should "show that there are three owners in alphabetical order" do
      assert_equal ["Alex", "Mark", "Rachel"], Owner.alphabetical.map{|o| o.first_name}
    end

    # test the scope 'active'
    should "show that there are only 2 atcive owners" do
      assert_equal 2, Owner.active.size
      assert_equal ["Alex", "Mark"], Owner.active.map{|o| o.first_name}.sort
    end

       # test the scope 'inactive'
       should "shows that there is one inactive owners" do
        assert_equal 1, Owner.inactive.size
        assert_equal ["Rachel"], Owner.inactive.map{|o| o.first_name}.sort
      end

      # test the scope 'search'
    should "shows that search for owner by either (part of) last or first name works" do
      assert_equal 3, Owner.search("Hei").size
      assert_equal 1, Owner.search("Mark").size
    end


    should "show that name method works" do
      assert_equal "Heimann, Alex", @alex.name
    end

     # test the method 'name' works
     should "shows that name method works" do
      assert_equal "Heimann, Alex", @alex.name
    end
    
    # test the method 'proper_name' works
    should "shows that proper_name method works" do
      assert_equal "Alex Heimann", @alex.proper_name
    end
    
     # test the callback is working 'reformat_phone'
     should "shows that Mark's phone is stripped of non-digits" do
      assert_equal "4122688211", @mark.phone.gsub(/[^0-9]/,'')
    end

  end # end of context

end