class UsersController < ApplicationController
    # def index
    #     @users = User.all
    #     render json: @users
    # end
    def show
        if (has_valid_token)
            @user = User.find(params[:id])
            render json: @user
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end
end
