class ToursController < ApplicationController
    before_action :require_login

    def index 
        @tours = Tour.all
    end

    def show
        @tour = Tour.find(params[:id])
        @comment = Comment.new
        @comments = @tour.comments
    end

    def new
        @tour = Tour.new
        #@destination = @tour.build_destination(:country => "Country", :city => "City")
    end

    def create
        @tour = Tour.new(tour_params.merge(user_id: current_user.id))
        binding.pry
        if  @tour.save
            redirect_to tour_path(@tour)
        else
            render :new
        end
    end

    def edit 
        @tour = Tour.find(params[:id])
    end

    def update
        @tour = Tour.find(params[:id])
        @tour.update(tour_params)
        redirect_to tour_path(@tour)
    end

    def destroy
        Tour.find(params[:id]).destroy 
        redirect_to tours_url
    end

    private 

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def tour_params
        params.require(:tour).permit(:title, :description, :price, :duration, :user_id, :destination_id, :id, :destinations_attributes)
    end
    
end
