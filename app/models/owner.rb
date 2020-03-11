class Owner < ApplicationRecord

    # Callbacks
    before_save :reformat_phone
    # Relationships
    # -----------------------------
    has_many :pets
    has_many :visits, through: :pets

    # Scopes
    # -----------------------------
    scope :doha_only, ->{where(city: 'Doha')}
    # list owners in alphabetical order
    scope :alphabetical, ->{order('first_name')}
    # get all the owners who are active (not moved out and pet is alive)
    scope :active, ->{where(active:true)}
    # get all the owners who are inactive (have moved out or pet is dead)
    scope :inactive, ->{where.not(active:true)}
    # search for all the owners in the system by either first or last name
    scope :search, ->(term) { where('first_name LIKE ? OR last_name LIKE ?', "#{term}%", "#{term}%") }

    # Validations
    # -----------------------------
    # make sure required fields are present
    validates_presence_of :first_name, :last_name, :email, :phone
    # if zip included, it must be 5 digits only
    validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true
    # phone can have dashes, spaces, dots and parens, but must be 10 digits
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
    # email format (other regex for email exist; doesn't allow .museum, .aero, etc.)
    # Not allowing for .uk, .ca, etc. because this is a Pittsburgh business and customers not likely to be out-of-country
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
    # if state is given, must be one of the choices given (no hacking this field)
    validates_inclusion_of :state, in: ['PA', 'OH', 'WV'], message: "is not an option", allow_blank: true
    # if not limited to the three states, it might be better (but slightly slower) to write:
    # Set up a states array to make select menu easier later
    STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
    # validates_inclusion_of :state, in: STATES_LIST.map {|key, value| value}, message: "is not an option", allow_blank: true
  
    
    def name
      "#{last_name}, #{first_name}"
    end

    def proper_name
      "#{first_name} #{last_name}"
    end
      
  # Callback code
  private 
    # We need to strip non-digits before saving to db
    def reformat_phone
      ph= self.phone.to_s # change to string in case input as all numbers 
      ph.gsub(/[^0-9]/,'') # strip all non-digits
      self.phone=ph # reset self.phone to new string
    end


end
