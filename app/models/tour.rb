class Tour < ApplicationRecord
    #belongs_to :user 
    belongs_to :destination
    
    #has_many :destinations 
    #has_many :users_destinations
    #has_many :users through :users_destinations 
    #validates :title, format: { without: /[0-9]/, message: "does not allow numbers" }
end
