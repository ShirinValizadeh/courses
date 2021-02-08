require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest

    setup do 
        @user = create(:user)
        @course =create(:course , user: @user)
        sign_in @user
    end


    test 'should create course' do
        assert_difference('Coursenrollment.count') do
          post course_enrollments_url(@course),
               params: { coursenrollment: { course: @course } }

        assert_redirected_to course_url(@course)

        end
       
    end

end
