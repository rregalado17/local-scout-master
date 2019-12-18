class User < ApplicationRecord 
    has_many :destinations
    has_many :tours, through: :orders 

    

end
