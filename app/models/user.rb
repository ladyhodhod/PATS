class User < ApplicationRecord
  # Use built-in rails support for password protection
    has_secure_password

    #validations
    validates_presence_of :first_name, :last_name, :username
    validates_uniqueness_of :username
    validates_presence_of :password, :on =>:create
    validates_presence_of :password_confirmation, :on =>:create
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, :minimum =>4, message: "at least 4 characters long", :allow_blank => true
    validates_inclusion_of :role, in: %w( vet assistant), message: "is not part of the system"

    
    ROLES = [['Vet', :vet],['Assistant', :assistant]]

    # compares a user's role in the system with the role we are testing for.
    def role?(authorized_role)
        return false if role.nil?
        role.to_sym == authorized_role
    end



    #other methods
    def proper_name
        first_name + " " + last_name
    end 

    def name 
        last_name + "," +first_name
    end




    # login by username
    def self.authenticate(username, password)
       find_by_username(username).try(:authenticate, password)
    end

end
