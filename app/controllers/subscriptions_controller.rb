class SubscriptionsController < ApplicationController
    
    def create
        byebug
    end

    def destroy
        if(has_valid_token)   
            @subscription =  Subscription.find(params[:id])
            @subscription.destroy()
            render json: {message: "This subscription has been destroyed"}
        else
            render json: {message: "You don't have acess to this"}
        end
    end
end
