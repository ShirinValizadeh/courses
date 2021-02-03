require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @course = create(:course)
      @lesson = create(:lesson, course: @course)
    end

    test 'should show lesson' do
        get course_lesson_url(@course, @lesson)
        assert_response :success
      end
end


class LessonsControllerSignInTest < ActionDispatch::IntegrationTest
    setup do
      @course = create(:course)
      @lesson = create(:lesson, course: @course)
      sign_in create(:user)
    end

    test 'should show lesson' do
        get course_lesson_url(@course, @lesson)
        assert_response :success
      end
end


