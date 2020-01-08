module UsersHelper
    def users_header(user)
        if @user
          "Welcome #{@user.name}, this is your homepage!"
        else
          "Homepage!"
         end
    end
end
