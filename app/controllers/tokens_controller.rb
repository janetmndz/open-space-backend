class TokensController < ApplicationController

def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        byebug
        render json: token(user)
    else
        render json: { errors: [ "Wrong email or password, please try again" ] }, status: :unprocessable_entity
    end 
end


end