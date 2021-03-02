class CourseEnrollmentMailer < ApplicationMailer

    def enrollment_course_mailer
        @course = params[:course]
        @user = params[:user]
         mail(to: @user.email, subject: 'Welcome to This Course')
      end

end
