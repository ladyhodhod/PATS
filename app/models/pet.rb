class Pet < ApplicationRecord

# Relationships
# -----------------------------
belongs_to :owner
belongs_to :animal
has_many :visits

# Scopes
# -----------------------------
# order pets by their name

# order pets by their dob

# get all the pets we treat (not moved away or dead)
# scope :active, lambda 

# get all the pets we heave treated that moved away or died

# get all the female pets

# get all the male pets

# get all the female pets that are still getting treated

# get all the pets for a particular owner

# get all the pets who are a particular animal type


# get all the pets born before a certain date









# Validations
# -----------------------------
# First, make sure a name exists


end
