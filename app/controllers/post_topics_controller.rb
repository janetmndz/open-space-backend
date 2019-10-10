class PostTopicsController < ApplicationController
    def show
        if (has_valid_token)
            @postTopic = PostTopic.find(params[:id])
            render json: @postTopic
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end
end
