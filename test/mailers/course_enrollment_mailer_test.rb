require "test_helper"

class CourseEnrollmentMailerTest < ActionMailer::TestCase
  test "enrollment_course_mailer" do
    user = create(:user)
    course = create(:course)
    email = CourseEnrollmentMailer.with(course: course , user: user).enrollment_course_mailer


    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ["shirinvalizadeh6004@gmail.com"], email.from
    assert_equal [user.email], email.to
    assert_match "http://localhost:3000/courses#{course}", email.to_s

    
  
  end
end
