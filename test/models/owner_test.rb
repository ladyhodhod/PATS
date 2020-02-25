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

  # Test Callbacks


end
