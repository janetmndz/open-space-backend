class NotesController < ApplicationController
    def create
        if (has_valid_token)
            byebug
            # Note.create(params.require(:note).permit(:post_id, :user_id, :content))
            render json: {message: "Your reply was sent!"}
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end

    def show
        byebug
    end

    private

    def analyze_tone(text)
        tone = tone_analyzer().tone(
            tone_input: {text: text},
            content_type: "application/json"
        )
        textTone = tone.result["document_tone"]["tones"][0]
    end
end
