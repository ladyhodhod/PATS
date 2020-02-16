class Visit < ApplicationRecord
  belongs_to :pet
  has_one :animal, through: :pet
  has_one :owner, through: :pet

end
