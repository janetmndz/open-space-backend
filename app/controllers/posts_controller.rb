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
        topics = params[:post][:topics]
        postTopics = @post.topics.map{|pt| pt.id.to_s}

        # When there are new topics added, make new Post Topics
        if (!(topics - postTopics).empty?)
            @newTopics = topics - postTopics
            @newTopics.each{|nt| PostTopic.create(post_id: @post.id, topic_id: nt) }
            # Get this agai because some things have changed
            @post = Post.find(params[:id])
        end

        # When  there are topics removed, destroy Post Topics
        if(!(postTopics - topics).empty?)
            @removingTopics = postTopics - topics
            @removingTopics.each do |pt|
                pT = @post.post_topics.find_by(topic_id: pt)
                pT.destroy()
            end
            # Get this agai because some things have changed
            @post = Post.find(params[:id])
        end
        
        render json: @post
    end
end
