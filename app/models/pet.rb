class Pet < ApplicationRecord

# Relationships
# -----------------------------
belongs_to :owner
belongs_to :animal
has_many :visits

# Validations
# -----------------------------
# First, make sure a name exists
validates :name, :owner_id, :animal_id, presence: true
# validates_presence_of :owner_id, :animal_id, message: "cannot be blank"
# Second, make sure the animal is one of the types PATS treats
# here we use the validate method (not validates), as this is a 
# customized validation
validate :animal_type_treated_by_PATS
# # Third, make sure the owner_id is in the PATS system 
# validate :owner_is_active_in_PATS

# Scopes
# -----------------------------
# order pets by their name
scope :alphabetical, ->{order('name')}
# order pets by their dob
scope :by_age, ->{order('dob')}
# get all the pets we treat (not moved away or dead)
scope :active, ->{where(active: true)}
# get all the pets we heave treated that moved away or died
scope :inactive, ->{where(active: false)}
# get all the female pets
scope :females, ->{where(female: true)}
# get all the male pets
scope :males, ->{where(female: false)}
# scope :males, ->{where.not(female: true)}
# scope(:males, lambda{where(female: false)})
# get all the female pets that are still getting treated in PATS
scope :females_active, ->{where(female: true, active:true)}
# or
# scope :females_active, ->{where(active:true).females}
# get all the male pets that are still getting treated in PATS
scope :males_active, ->{where(active:true).males}
 # get all the pets for a particular owner
scope :for_owner, ->(owner_id) { where("owner_id = ?", owner_id) }
 # get all the pets who are a particular animal type
scope :by_animal, ->(animal_id) { where("animal_id = ?", animal_id) }
 # get all the pets born before a certain date
scope :born_before, ->(date) { where('dob < ?', date) }
# find all pets that have a name like some term or are and animal like some term
scope :search, ->(term) { joins(:animal).where('pets.name LIKE ?', "#{term}%").order("pets.name") }

 
def gender
    return "Female" if self.female
    "Male"
end 
# Use private methods to execute the custom validations
# -----------------------------
private 
def owner_is_active_in_PATS
    # get an array of all active owners in PATS
    all_owner_ids=Owner.active.all.map{|o| o.id}
    unless all_owner_ids.include?(self.owner_id)
        errors.add(:owner, "is not an active owner in PATS")
    end
end

def animal_type_treated_by_PATS
    all_animal_ids=Animal.all.map{|a| a.id}
    unless all_animal_ids.include?(self.animal_id)
        errors.add(:animal, "is not treated in PATS")
    end

end


end
