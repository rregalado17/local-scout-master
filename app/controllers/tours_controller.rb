class ToursController < ApplicationController

    def index 
        @tours = Tour.all
    end

    def show
        @tour = Tour.find(params[:id])
    end

    def new
        @tour = Tour.new
    end

    def create 
        @tour = Tour.new(tour_params)
        #if @tour.valid?
            @tour.save
            #redirect_to tour_path(@tour)
        #else
            #render :new
        #end
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

    def tour_params
        params.require(:tour).permit(:title, :destination_id, :price, :duration, :description)
    end
    
end
