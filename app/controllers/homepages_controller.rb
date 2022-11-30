class HomepagesController < ApplicationController

    def home
        redirect_to tours_path if logged_in?
    end

    def about
    end

end