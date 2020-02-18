class Visit < ApplicationRecord

  # Relationships
# -----------------------------
  belongs_to :pet
  has_one :animal, through: :pet
  has_one :owner, through: :pet


  # Scopes
  # -----------------------------
  # by default, order by visits in descending order (most recent first)
  scope :chronological, -> { order('date DESC') }
  # get all the visits by a particular pet (using the 'stabby lambda' notation here)
  scope :for_pet, ->(pet_id) { where('pet_id = ?', pet_id) }
  # get the last X visits (using the 'stabby lambda' notation here)
  scope :last_x, ->(num) { limit(num).order('date DESC') }

  # Validations
  # -----------------------------

  validates_presence_of :pet_id, message: "The Pet ID should be provided!"
  # weight must be present and a number greater than 0 and less than 100 (none of our animal types will exceed)
  validates :weight, presence:true, numericality: {greater_than:0, less_than:100}
  # date must be a valid date
  validates_date :date # this is provided in a library that should be added to the Gemfile: gem 'validates_timeliness', '4.0.2'
  
end
