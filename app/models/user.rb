class User < ActiveRecord::Base
    has_many :destinations
    has_many :comments
    has_many :tours, through: :comments
    #has_many :tours, through destinations
    #has_many :users_destinations
    #has_many :destinations through :users_destinations 

    

end
