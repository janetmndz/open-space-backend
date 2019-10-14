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
        topics = params[:topics]
        postTopics = @post.topics.map{|pt| pt.id.to_s}
        if (postTopics.count < topics.count)
            @newTopics = topics.select{|pt| !postTopics.include?(pt)}
            @newTopics.each{|nt| PostTopic.create(post_id: @post.id, topic_id: nt) }
        elseif(postTopics.count > topics.count)
            @removingTopics = postTopics - topics
            @removingTopics.each do |pt|
                pT = @post.post_topics.find_by(topic_id: pt)
                pT.destroy()
            end
        end

        render json: @post
    end
end
