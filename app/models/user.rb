class User < ApplicationRecord 
    has_many :destinations
    #has_many :tours, through destinations
    #has_many :users_destinations
    #has_many :destinations through :users_destinations 

    

end
