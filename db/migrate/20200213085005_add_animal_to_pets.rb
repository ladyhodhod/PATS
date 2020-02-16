class AddAnimalToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :animal, foreign_key: true
  end
end
