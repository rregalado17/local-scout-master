class ToursController < ApplicationController

    def index 

    end

    def create 
        Tour.create(title: params[:tour][:title], destination: params[:tour][:destination], price: params[:tour][:price], duration: params[:tour][:price], description: params[:tour][:description])
        redirect_to tours_path
    end

    def edit 

    end

    def update

    end

    def destroy

    end
    
end
