class PostTopicsController < ApplicationController
    def show
        @postTopic = PostTopic.find(params[:id])
        render json: @postTopic
    end
end
