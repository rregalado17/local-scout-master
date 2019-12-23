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
        @tour.save
        redirect_to tour_path(@tour)
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

    end

    private 

    def tour_params
        params.require(:tour).permit(:title, :destination, :price, :duration, :description)
    end
    
end
