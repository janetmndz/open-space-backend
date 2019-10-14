class PostsController < ApplicationController
    def index
        if (has_valid_token)
            @posts = Post.all
            render json: @posts
        else
            render json: {message: "You don't got access to this."}, status: :unauthorized
        end
    end

    def show
        if (has_valid_token)
            @post = Post.find(params[:id])
            render json: @post
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update(params.require(:post).permit(:content))
        render json: @post
    end
end
