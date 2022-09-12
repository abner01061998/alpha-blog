class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy, :update]
    before_action :require_user, only: [:edit, :udpate]
    before_action :require_same_user, only: [:edit, :udpate, :destroy]

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index 
        @users = User.paginate(page: params[:page], per_page: 5)
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
            session[:user_id] = @user.id 
            redirect_to @user
        else
            render "new"
        end
    end

    def edit 
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "The accout #{@user.username} was successfully updated"
            redirect_to @user
        else
            render "edit"
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated articles deleted"
        redirect_to articles_path
    end

    private 
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    def set_user
        @user = User.find(params[:id])
    end 

    def require_same_user
        if current_user != @user
            flash[:alert] = "You can only modify your own profile"
            redirect_to @user, status: :see_other
        end
    end
    
end
