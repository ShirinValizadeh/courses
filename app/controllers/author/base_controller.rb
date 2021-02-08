# frozen_string_literal: true

module Author
  class BaseController < LoggedInController
    before_action :correct_user

    private

    def correct_user
      redirect_to courses_path, notice: 'Not Authorized To Edit This Course' unless current_user.author?
    end
  end
end
