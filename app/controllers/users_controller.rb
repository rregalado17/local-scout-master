class UsersController < ApplicationController 

    def new
        @user = User.new
    end

    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show 
        @user = User.find_by(:id => params[:id])
    end

    def edit
        @tour = Tour.find(params[:id])
    end

    private 
    def user_params
        params.require(:user).permit(:name, :password)
    end
end
