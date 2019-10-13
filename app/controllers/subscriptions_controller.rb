class SubscriptionsController < ApplicationController
    
    def create
        if(has_valid_token)  
            @subscription = Subscription.create(subs_params)
            render json: @subscription
        else
            render json: {message: "You don't have acess to this"}
        end
    end

    def destroy
        if(has_valid_token)   
            @subscription =  Subscription.find(params[:id])
            @topic = @subscription.topic
            @subscription.destroy()
            render json: @topic
        else
            render json: {message: "You don't have acess to this"}
        end
    end

    private

    def subs_params
        params.require(:subscription).permit(:topic_id, :user_id)
    end
end
