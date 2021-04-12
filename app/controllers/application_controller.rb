# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_locale
    after_action :track_action


    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      
    end
      

    protected

    def track_action
      ahoy.track "Ran action", request.path_parameters
    end

end
