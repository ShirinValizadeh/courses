require 'test_helper'

class Author::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = create(:author)
    @course = create(:course, user: @author)
    @lesson = create(:lesson, course: @course)

    @another_author = create(:author)
    @another_author_course = create(:course, user: @another_author)
    @another_author_course_lesson = create(:lesson, course: @another_author_course)
   
    sign_in @author
  end



  test 'should get new' do
    get new_author_course_lesson_url(@course)
    assert_response :success
  end



  test 'should create lesson' do
    assert_difference('Lesson.count') do
      post  author_course_lessons_url(@course),
           params: { lesson: { body: "example new body", title: "example new title" } }
    end

    assert_redirected_to author_course_url(@course)
  end



  test 'should show lesson' do
    get author_course_lesson_url(@course, @lesson)
    assert_response :success
  end

  test 'should NOT show course of another author' do
    assert_raise ActiveRecord::RecordNotFound do
      get author_course_lesson_url(@another_author_course, @another_author_course_lesson)
    end
  end

  test 'should get edit' do
    get edit_author_course_lesson_url(@course, @lesson)
    assert_response :success
  end

  test 'should update lesson' do
    patch author_course_lesson_url(@course, @lesson),
          params: { lesson: { body: "example new body", title: "example new title"} }
    assert_redirected_to author_course_url(@course)
  end

  test 'should destroy lesson' do
    assert_difference('Lesson.count', -1) do
      delete author_course_lesson_url(@course, @lesson)
    end

    assert_redirected_to author_course_url(@course)
  end
end
