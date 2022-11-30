class DestinationsController < ApplicationController
    before_action :require_login

    def index
        @destinations = Destination.all
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

    private 
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
    def destination_params
        params.require(:destination).permit(:country, :city)
    end

end
