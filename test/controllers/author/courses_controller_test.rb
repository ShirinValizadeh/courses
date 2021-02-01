require 'test_helper'

class Author::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = create(:author)
    @course = create(:course, user: @author)

    @another_author = create(:author)
    @another_author_course = create(:course, user: @another_author)
    sign_in @author
  end

  test 'should get index' do
    get author_courses_url
    assert_response :success
    assert_match @course.title, response.body
    assert_no_match @another_author_course.title, response.body
  end

  test 'should get new' do
    get new_author_course_url
    assert_response :success
  end

  test 'should create course' do
    assert_difference('Course.count') do
      post author_courses_url,
           params: { course: { description: @course.description, published: @course.published, title: @course.title } }
    end

    assert_redirected_to author_courses_url
  end

  test 'should show course' do
    get author_course_url(@course)
    assert_response :success
  end

  test 'should NOT show course of another author' do
    assert_raise ActiveRecord::RecordNotFound do
      get author_course_url(@another_author_course)
    end
  end

  test 'should get edit' do
    get edit_author_course_url(@course)
    assert_response :success
  end

  test 'should update course' do
    patch author_course_url(@course),
          params: { course: { description: @course.description, published: @course.published, title: @course.title } }
    assert_redirected_to author_course_url(@course)
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete author_course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
