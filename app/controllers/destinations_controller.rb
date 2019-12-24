class DestinationsController < ApplicationController

    def index 

    end

    def new
        @destination = Destination.new
    end

    def create 
        @destination = Destination.create(destination_params)
        redirect_to destination_path(@destination)
    end

    def edit 
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find(params[:id])
        @destination.update(destination_params)
        redirect_to destination_path(@destination)
    end

    def destroy

    end

    private 

    def destination_params
        params.require(:destination).permit(:country, :city)
    end

end
