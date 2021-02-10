# frozen_string_literal: true

module Admin
  class BaseController < LoggedInController
    before_action :correct_user  #admin

    private

    def correct_user
      redirect_to postings_path, notice: 'Not Authorized To Edit This Course' unless current_user.admin?
    end
  end
end
