class MurmrsController < ApplicationController

    def index
       @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followees, owner_type: "User")
       @post = Post.new
    end
    
end