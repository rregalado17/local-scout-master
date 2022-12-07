class ToursController < ApplicationController
    before_action :set_tour, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index]

    def show 
        @tour = Tour.find(params[:id])
        @comment = Comment.new
        @comments = @tour.comments
    end

    def index
        @tours = Tour.paginate(page: params[:page], per_page: 6)
    end

    def new
        @tour = Tour.new
    end

    def create
        @user = User.find_by_id(session[:user_id])
        @tour = Tour.new(tour_params.merge(user_id: current_user.id))
        if @tour.save
            flash[:notice] = "Tour created successfully!"
            redirect_to @tour
        else
            render "new"
        end
    end
 
    def update
        if @tour.update(tour_params)
            flash[:notice] = "Tour was updated successfully"
        else
            render 'edit'
        end
    end

    def destroy
        Tour.find(params[:id]).destroy
        redirect_to tours_url
    end

    private 
    def tour_params
        params.require(:tour).permit(:title, :description, :price, :duration, :user_id, :destination_id, :id, :destinations_attributes)
    end
    def set_tour
        @tour = Tour.find(params[:id])
    end
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
