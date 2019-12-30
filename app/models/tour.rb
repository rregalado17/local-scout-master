class Tour < ActiveRecord::Base
    #belongs_to :user 
    belongs_to :destination
    has_many :comments
    has_many :tour_destinations
    #has_many :destinations, through: :tour_destinations
    has_many :users, through: :comments
    #accepts_nested_attributes_for :destinations

    def destination_city=(city)
        self.destination = Destination.find_or_create_by(city: city)
    end

    def destination_city
       self.destination ? self.destination.city : nil  
    end
    
    #def destinations_attributes=(destination_attributes)
        #destinations_attributes.values.each do |d_attribute|
            #destination = Destination.find_by_or_create_by(d_attribute)
            #self.destinations << destination
        #end            
    #end


    #has_many :destinations 
    #has_many :users_destinations
    #has_many :users through :users_destinations 
    #validates :title, format: { without: /[0-9]/, message: "does not allow numbers" }
end
