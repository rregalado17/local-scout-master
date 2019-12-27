class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def show
        @destination = Destination.find(params[:id])
    end

    def create 
        @destination = Destination.new(destination_params)
        if @destination.valid?
            @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
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
