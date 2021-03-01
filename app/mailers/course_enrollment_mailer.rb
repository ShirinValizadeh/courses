class CourseEnrollmentMailer < ApplicationMailer

    def enrollment_course_mailer
        @user = params[:user]
         mail(to: @user.email, subject: 'Welcome to This Course')
      end

end
