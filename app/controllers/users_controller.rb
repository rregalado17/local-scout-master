class UsersController < ApplicationController 

    # before_actio :set_user, only:[:show, :edit, :update, :destroy]
    # before_action :require_user, only: [:edit, :update]
    # before_action :require_same_user, only: [:edit, :update, :destroy]


    # def show
    #     @stocks = @user.stocks.paginate(page: params[:page], per_page: 3)
    # end

    # def index
    #     @users = User.paginate(page: params[:page], per_page: 3)
    # end

    # def new
    #     @user = User.new
    # end

    # def edit
    # end

    # def update
    #     if @user.update(user_params)
    #         flash[:notice] = "Your profile has been successfully updated!"
    #         redirect_to @user
    #     else
    #         render 'edit'
    #     end
    # end

    # def create 
    #     @user = User.new(user_params)
    #     if @user.save
    #         session[:user_id] = @user.id
    #         flash[:notice] = "Welcome to Plutus #{@user.username}"
    #         redirect_to stocks_path
    #     else
    #         render 'new'
    #     end
    # end 

    # def destroy
    #     @user.destroy 
    #     session[:user_id] = nil if @user == current_user
    #     flash[:notice] = "Account deleted"
    #     redirect_to stocks_path
    # end


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

    # def set_user
    #     @user = User.find(params[:id])
    # end

    # def require_same_user
    #     if current_user != @user && !current_user.admin?
    #         flash[:alert] = "You can only edit or delete your own profile"
    #         redirect_to @user
    #     end
    # end
end






