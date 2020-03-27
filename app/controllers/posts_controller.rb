class PostsController < ApplicationController
    # before_action :require_login
    before_action :find_post, only: [:destroy, :show, :edit, :update, :post_likes, :post_comments]


    def index
        @posts = Post.order(created_at: :desc)
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            @post.create_activity :create, owner: @current_user           
            redirect_to root_path      
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @post.update(post_params)
        @post.create_activity :update, owner: current_user
        redirect_to root_path
    end

    def destroy
        @post.destroy
    end

    def post_likes
        Like.create(post_id: @post.id, user_id: @current_user.id)
    end

    def post_comments
        Comment.create(post_id: @post.id, user_id: @current_user.id)
    end

    private

    def post_params
        params.require(:post).permit(:content, :category_id, :user_id)
    end

    def find_post
            @post = Post.find(params[:id])
    end

end