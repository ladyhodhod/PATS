# Mock object testing involves the use of fake objects as stand-ins for your real objects to support automated
# testing
# Factory Bot, originally known as Factory Girl, is a software library for the Ruby programming 
# language that provides factory methods to create test objects for automated software testing.
#  Factory Bot is often used in testing Ruby on Rails applications;
#  where it replaces Rails' built-in fixture mechanism.

FactoryBot.define do
  # The class of the test object is either determined through the name of the factory or 
  # set explicitly.

  factory :owner do
    first_name {"Alex"}
    last_name {"Heimann"}
    street {"10152 Sudberry Drive"}
    city {"Wexford"}
    state {"PA"}
    zip {"15090"}
    active {true}
    phone {rand(10 ** 10).to_s.rjust(10,'0') }
    email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
  end

   #factory blueprint for animal
    factory :animal do
      name "Cat"
      active true
    end


  #factory blueprint for pet
    factory :pet do
      name "Dusty"
      female true
      active true
      dob 10.years.ago
      association :owner  # don't have to put the word association in front, but I think it helps...
      association :animal
    end
    
    #factory blueprint for visit
    factory :visit do
      association :pet 
      date 6.months.ago.to_date
      weight 5.0
      overnight_stay false
      total_charge 5000
    end
    
end