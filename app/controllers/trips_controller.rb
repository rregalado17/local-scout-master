class TripsController < ApplicationController 
    before_action :require_login

    def index
       @trips = Trip.all  
    end
    
    def show
    end

    def new
        @trip = Trip.new 
    end

    def edit 
    end

    def create 
        @trip = Trip.new(user_id: current_user.id, tour_id: params[:tour_id])
        @tour = Tour.find(params[:tour_id])
        if @trip.save
            redirect_to user_path(current_user), notice:@trip.take_trip
        else 
            redirect_to tour_path(tour), notice: "You were unable to tour the #{@trip.tour.title}."
        end
    end


    def update
    end
    

    private 
    def trip_params 
       params.require(:trip).permit(:name, :user_id, :tour_id, :destination_id, :tours_attributes) 
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
