class Destination < ActiveRecord::Base
    has_many :tours
    #has_many :users, through :tours
    #validations
    has_many :tour_destinations
    #has_many :tours, through: :tour_destinations

end
