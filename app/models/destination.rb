class Destination < ApplicationRecord
    has_many :tours
    #has_many :users, through :tours
    #validations

end
