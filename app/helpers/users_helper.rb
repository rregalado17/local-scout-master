module UsersHelper
    def users_header(user)
        if @user
          "Welcome #{@user.username}, this is your homepage!"
        else
          "Homepage!"
         end
    end
end
