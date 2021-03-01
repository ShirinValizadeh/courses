# Preview all emails at http://localhost:3000/rails/mailers/course_enrollment_mailer
class CourseEnrollmentMailerPreview < ActionMailer::Preview
    def enrollment_course_mailer
        CourseEnrollmentMailer.with(course: User.first).enrollment_course_mailer
      end
end
