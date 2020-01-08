class UsersController < ApplicationController 

    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:custom_error_message_1] = "Please complete form correctly."
            render :new
        end
    end

    def show 
        if logged_in?
        @user = current_user
        else
            redirect_to root_path
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private 
    def user_params
        params.require(:user).permit(:name, :username, :password, :budget, :vacation_time)
    end
end
