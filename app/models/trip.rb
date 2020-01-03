class Trip < ActiveRecord::Base
    belongs_to :user 
    belongs_to :tour

    def take_trip 
        if youre_broke? &&  
            "You need to go back to work and save more money. You don't have enough time or cash for the #{tour.title} tour."
        elsif youre_broke?
            "Looks like your budget ran out. Consider going on this #{tour.title} tour when you have some cash."
        elsif youre_out_of_time?
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

end
