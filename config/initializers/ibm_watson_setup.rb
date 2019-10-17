require "ibm_watson/authenticators"
require "ibm_watson/tone_analyzer_v3"
include IBMWatson

APIKEY = ENV['ibm_watson_key']
VERSION = ENV['ibm_watson_version']
URL = ENV['ibm_watson_url']
authenticator = Authenticators::IamAuthenticator.new(
    apikey: APIKEY
)
TONE_ANALYZER = ToneAnalyzerV3.new(
    version: VERSION,
    authenticator: authenticator
)
TONE_ANALYZER.service_url = URL
TONE_ANALYZER