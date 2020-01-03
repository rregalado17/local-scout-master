class Tour < ActiveRecord::Base
    belongs_to :user 
    belongs_to :destination
    has_many :comments
    #has_many :tour_destinations
    #has_many :destinations, through: :tour_destinations
    #has_many :users, through: :comments
    #accepts_nested_attributes_for :destinations

    def destinations_attributes=(city)
        #self.destination.build(destinations_attributes)

        self.destination = Destination.find_or_create_by(city: city)
    end

    def destinations_attributes
       self.destination ? self.destination.city : nil  
    end
    
    #def destinations_attributes=(destination_attributes)
        #destinations_attributes.values.each do |d_attribute|
            #destination = Destination.find_by_or_create_by(d_attribute)
            #self.destinations << destination
        #end            
    #end

    def take_tour 
        if youre_broke? && youre_out_of_time? 
            "You need to go back to work and save more money. You don't have enough time or cash for the #{tour.tile} tour."
        elsif youre_broke?
            "Looks like your budget ran out. Consider going on this #{tour.tilte} tour when you have some cash."
        elsif youre_out_of_time
            "Looks like you dont have enough time to take this #{tour.title} tour."
        else
            user.update(tickets: user.budget -= tour.price, nausea: user.vacation_time -= tour.duration)
            "Thanks for taking our #{tour.title} tour!"
        end
    end

    def youre_broke?
        user.budget < user.price
    end

    def youre_out_of_time? 
        user.vacation_time < tour.duration
    end


    #has_many :destinations 
    #has_many :users_destinations
    #has_many :users through :users_destinations 
    #validates :title, format: { without: /[0-9]/, message: "does not allow numbers" }
end
