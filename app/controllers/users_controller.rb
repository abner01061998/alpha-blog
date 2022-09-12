class UsersController < ApplicationController

    def index 

    end 

    def new
        @user = User.new
    end 
    
    def signup
        
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha-Blog dear #{@user.username}"
            redirect_to articles_path
        else
            render "new"
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    
end