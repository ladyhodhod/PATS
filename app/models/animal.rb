class Animal < ApplicationRecord
    
    # Relationships
    # -----------------------------
    has_many :pets

    # Scopes
    # -----------------------------
    scope :alphabetical, -> { order('name') }
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
   

    # Validations
    # -----------------------------
    # validates_presence_of :name
    # validates_uniqueness_of :name
    # OR
    # validates :name, presence: true
    # validates :name, uniqueness: true
    # OR
    validates :name, presence: true#, uniqueness: true

end
