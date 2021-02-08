# frozen_string_literal: true

require 'test_helper'

# class LessonsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @course = create(:course)
#     @lesson = create(:lesson, course: @course)
#   end

#   test 'should show lesson' do
#     get course_lesson_url(@course, @lesson)
#     assert_response :success
#   end
# end

class LessonsControllerSignInTest < ActionDispatch::IntegrationTest
  setup do
    @course = create(:course)
    @lesson = create(:lesson, course: @course)
    @user =create(:user)
    sign_in @user
  end

  test 'if is sign in und not Enrolled should redirect to course lesson' do
    get course_lesson_url(@course, @lesson)
    assert_redirected_to course_url(@course)
  end
end



class LessonsControllerEnrollmentTest < ActionDispatch::IntegrationTest
  setup do
    @course = create(:course )
    @user = create(:user)
    @lesson = create(:lesson, course: @course)
    @enrollment = create(:coursenrollment ,course: @course , user: @user)
    sign_in @user
  end

  test 'should show lesson wenn is Enrollment and sign in' do
    get course_lesson_url( @course , @lesson)
    assert_response :success
  end

end

