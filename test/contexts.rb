# require needed files
require './test/sets/animals'
require './test/sets/owners'
require './test/sets/pets'
require './test/sets/visits'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Animals
  include Contexts::Owners
  include Contexts::Pets
  include Contexts::Visits

  
  def create_all
    create_animals
    create_owners
    create_pets
    create_visits
  end
  
end