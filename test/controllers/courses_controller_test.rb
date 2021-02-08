# frozen_string_literal: true

require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = create(:course)
  end

  test 'should get index' do
    get courses_url
    assert_response :success
  end

  test 'should show course' do
    get course_url(@course)
    assert_response :success
  end
end

class CoursesControllerSignInTest < ActionDispatch::IntegrationTest
  setup do
    @course = create(:course)
    sign_in create(:user)
  end

  test 'should get index' do
    get courses_url
    assert_response :success
  end

  test 'should show course' do
    get course_url(@course)
    assert_response :success
  end
end


