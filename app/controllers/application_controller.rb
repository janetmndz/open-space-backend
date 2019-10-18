class ApplicationController < ActionController::API

    def token(user)
        payload = {
        user_id: user.id
        }
        token = JWT.encode(payload, secret_token, 'HS256')
        {
        token: token,
        user_id: user.id
        }
    end

    private

    def secret_token
        ENV["jwt_secret_key"]
    end

    def has_valid_token
        !!logged_in_user_id
    end

    def logged_in_user_id
        token = request.headers["Authorization"]
        begin
            dumb_array = JWT.decode(token, secret_token, true, { algorithm: 'HS256' })
            payload = dumb_array.first
            user_id = payload["user_id"]
            return user_id
        rescue
            return nil
        end
    end

    # APIKEY = ENV['ibm_watson_key']
    # VERSION = ENV['ibm_watson_version']
    # URL = ENV['ibm_watson_url']

    # authenticator = Authenticators::IamAuthenticator.new(
    #     apikey: APIKEY
    # )

    # # tone_analyzer = ToneAnalyzerV3.new(
    # #     version: VERSION,
    # #     authenticator: authenticator
    # # )
    # # tone_analyzer.service_url = URL

end