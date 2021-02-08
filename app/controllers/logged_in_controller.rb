# frozen_string_literal: true

class LoggedInController < ApplicationController
  before_action :authenticate_user!
end
