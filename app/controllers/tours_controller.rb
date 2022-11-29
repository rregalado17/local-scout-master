class ToursController < ApplicationController
    before_action :require_login
    # before_action :set_stock, only: [:show, :edit, :update, :destroy]
    # before_action :require_user, except: [:show, :index]
    # before_action :require_same_user, only: [:edit, :update, :destroy]

    def show 
        @tour = Tour.find(params[:id])
        @comment = Comment.new
        @comments = @tour.comments
    end

    def index
        # @tours = Tour.paginate(page: params[:page], per_page: 3)
        @tours = Tour.all

    end

    def new
        @tour = Tour.new

    end



#     @user = User.find_by_id(session[:user_id])
#     @tour = Tour.new(tour_params.merge(user_id: current_user.id))
#     if  @tour.save
#         redirect_to tour_path(@tour)
#     else
#         render :new
#     end

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
        @tour.destroy
        redirect_to stocks_path

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




# def index 
#     @tours = Tour.all
# end

# def show
#     @tour = Tour.find(params[:id])
#     @comment = Comment.new
#     @comments = @tour.comments
# end

# def new
#     @tour = Tour.new
#     #@destination = @tour.build_destination(:country => "Country", :city => "City")
# end

# def create
#     @user = User.find_by_id(session[:user_id])
#     @tour = Tour.new(tour_params.merge(user_id: current_user.id))
#     if  @tour.save
#         redirect_to tour_path(@tour)
#     else
#         render :new
#     end
# end

# def edit 
#     @tour = Tour.find(params[:id])
# end

# def update
#     @tour = Tour.find(params[:id])
#     @tour.update(tour_params)
#     redirect_to tour_path(@tour)
# end

# def destroy
#     Tour.find(params[:id]).destroy 
#     redirect_to tours_url
# end

# private 
# def require_login
#     return head(:forbidden) unless session.include? :user_id
# end
