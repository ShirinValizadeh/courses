require "test_helper"

class CompletedlessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @course = create(:course )
    @lesson = create(:lesson, course: @course)
    @enrollment = create(:coursenrollment ,course: @course , user: @user)
   
    sign_in @user
  end


  test "should create completed lesson and redirected to finished course page if course is completed" do
    assert_difference('Completedlesson.count') do
      post course_completedlessons_url(@course),
       params: { lesson_id: @lesson.id }
    end
    assert_redirected_to finished_course_url(@course)
  
  end

  test "should create completed lesson and redirected to next lesson if course is NOT completed" do
    create(:lesson, course: @course)
    assert_difference('Completedlesson.count') do
      post course_completedlessons_url(@course),
      params: { lesson_id: @lesson.id }
    end
    assert_redirected_to course_lesson_url(@course, @course.next_lesson(@lesson))
  end

  test "should only redirected to finished course page if course is completed" do
    create(:completedlesson, lesson: @lesson, course: @course, user: @user)
    assert_no_difference('Completedlesson.count') do
      post course_completedlessons_url(@course),
      params: { lesson_id: @lesson.id }
    end
    assert_redirected_to finished_course_url(@course)
  end

  test "should only redirected to next lesson if course is NOT completed" do
    create(:completedlesson, lesson: @lesson, course: @course, user: @user)
    create(:lesson, course: @course)
    assert_no_difference('Completedlesson.count') do
      post course_completedlessons_url(@course),
      params: { lesson_id: @lesson.id }
    end
    assert_redirected_to course_lesson_url(@course, @course.next_lesson(@lesson))
  end


  # test "should destroy completedlesson" do
  #   assert_difference('Completedlesson.count', -1) do
  #     delete completedlesson_url(@completedlesson)
  #   end

  #   assert_redirected_to completedlessons_url
  # end
end
