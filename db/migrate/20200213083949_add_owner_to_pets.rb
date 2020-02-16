class AddOwnerToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :owner, foreign_key: true
  end
end
