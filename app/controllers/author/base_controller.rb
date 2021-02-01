module Author
  class BaseController < LoggedInController
    before_action :correct_user

    private

    def correct_user
      if !current_user.author?
        redirect_to courses_path, notice: "Not Authorized To Edit This Course"
      end
    end
  end
end