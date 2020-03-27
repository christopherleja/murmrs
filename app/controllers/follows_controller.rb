class FollowsController < ApplicationController
    before_action :require_login


    def show
    end

    def new
        @user = User.find(params[:id])
    end

    def create
        @user = User.find(params[:id])
        Follow.create(followee_id: @user.id, follower_id: current_user_id)
        redirect_to @user
    end

    def destroy
    end


    
end