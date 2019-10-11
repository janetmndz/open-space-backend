class UsersController < ApplicationController
    def show
        if (has_valid_token)
            @user = User.find(params[:id])
            render json: @user
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end

    def create
        new_user_params = user_params
        user_password = params[:password]
        new_user_params[:password] = user_password
        @user = User.create(new_user_params)
        if @user.valid?
            render json: token(@user)
        else
            render json: {errors: @user.errors.full_message}
        end

    end
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
