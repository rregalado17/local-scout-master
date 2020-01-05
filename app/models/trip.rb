class Trip < ActiveRecord::Base
    belongs_to :user 
    belongs_to :tour
    #belongs_to :destination

    def take_trip 
        if youre_broke? && youre_out_of_time?
            trip_rejection
            "You need to go back to work and save more money. You don't have enough time or cash for the #{tour.title} tour."
        elsif youre_broke?
            trip_rejection
            "Looks like your budget ran out. Consider going on this #{tour.title} tour when you have some cash."
        elsif youre_out_of_time?
            trip_rejection
            "Looks like you dont have enough time to take this #{tour.title} tour."
        else
            user.update(budget: user.budget -= tour.price, vacation_time: user.vacation_time -= tour.duration)
            "Thanks for taking our #{tour.title} tour!"
        end
    end

    def youre_broke?
        user.budget < tour.price
    end

    def youre_out_of_time?
        user.vacation_time < tour.duration 
    end

    def trip_rejection
        Trip.destroy(self.id)
    end

    def tours_attributes=(title)
        #self.destination.build(destinations_attributes)

        self.title = Tour.find_or_create_by(title: title)
    end

    def tours_attributes
       self.title ? self.tour.title : nil  
    end
end
