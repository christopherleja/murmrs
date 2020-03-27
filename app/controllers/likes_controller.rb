class LikesController < ApplicationController

    def new
        @like = Like.new
    end
    
    def create
       @like = Like.create(post_id: params[:post_id], user_id: logged_in_user_id)
       if !@like.valid?
        flash[:errors] = @like.errors.full_messages
       end
       redirect_to post_path
    end

    def destroy
        @like = Like.find(params[:id])
        if logged_in_user_id == @like.user_id
            @like.destroy
        end
        redirect_to post_path
    end

end