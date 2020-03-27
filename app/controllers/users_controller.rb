class UsersController < ApplicationController

    skip_before_action :confirm_login, only: [:new, :create]
    skip_before_action :ensure_authenticated, only: [:new, :create]
    before_action :find_user, only: [:destroy, :show, :edit, :update, :following, :followers, :likes, :discover, :follow, :unfollow]

    def index
        @users = User.all
    end

    def show
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.destroy
    end

    def following
    end

    def followers
    end

    def likes
    end

    def discover
        @users = @user.discover_users
    end

    def follow
        current_user.followers << @user
        redirect_to @user
    end

    def unfollow
        follow = Follow.find_by(follower_id: @user.id, followee_id: current_user.id)
        follow.destroy
        redirect_to @user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :bio, :avatar)
    end

    def find_user
        @user = User.find(params[:id])
    end
    
end