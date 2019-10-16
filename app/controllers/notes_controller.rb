class NotesController < ApplicationController
    def create
        if (has_valid_token)
            Note.create(params.require(:note).permit(:post_id, :user_id, :content))
            render json: {message: "Your reply was sent!"}
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end
end
