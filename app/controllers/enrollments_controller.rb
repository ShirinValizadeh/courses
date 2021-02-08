# frozen_string_literal: true

class EnrollmentsController < LoggedInController
  def create
    @course = Course.find(params[:course_id])
    Coursenrollment.create!(course: @course, user: current_user)
    redirect_to course_url(@course), notice: 'You enrolled. Yay'
  end
end

# test for this file