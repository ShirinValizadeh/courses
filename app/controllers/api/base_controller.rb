module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate

    private

    def authenticate
      # p '======='
      # p request.headers
      authenticate_or_request_with_http_token do |token, _options|
        # p '>>>>>'
        # p token
        # p _options
        # p User.find_by(api_token: token)
        User.find_by(api_token: token)
      end
    end

    def current_user
      @current_user ||= authenticate
    end
  end
end
