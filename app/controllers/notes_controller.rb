class NotesController < ApplicationController
    def create
        if (has_valid_token)
            # @text = params[:note][:content]
            # @results = analyze_tone(@text)
            # byebug
            @note = Note.create(params.require(:note).permit(:post_id, :user_id, :content))
            if @note.valid? 
                render json: {message: "Your reply was sent!"}
            else
                render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
            end
            
        else
            render json: {message: "You don't got access to this"}, status: :unauthorized
        end
    end

    def show
        byebug
    end

    private

    def analyze_tone(text)
        tone = TONE_ANALYZER.tone(
            tone_input: {text: text},
            content_type: "application/json"
        )
        tone.result["document_tone"]["tones"]
    end
end
