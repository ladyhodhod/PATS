class Owner < ApplicationRecord
    has_many :pets
    has_many :visits, through: :pets
end
