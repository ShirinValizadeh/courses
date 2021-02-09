# frozen_string_literal: true

module admin
  class BaseController < LoggedInController
    before_action :correct_user

    private

    def correct_user
      redirect_to postings_path, notice: 'Not Authorized To Edit This Course' unless current_user.admin?
    end
  end
end
