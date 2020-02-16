class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :female
      t.date :dob
      t.boolean :active

      t.timestamps
    end
  end
end
