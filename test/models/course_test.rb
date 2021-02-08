# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'the truth' do
    # course = create(:course) #Course.create

    course = build(:course) # Course.new
    assert course.valid?

    course = build(:course, user: nil) # creat course wenn user ?
    assert_not course.valid?

    course = build(:course, title: nil) # creat course wenn title ?
    assert_not course.valid?
  end

  test '#lessons_count returns number of lessons' do
    course = create(:course)
    create(:lesson, course: course)
    assert_equal 1, course.lessons_count
  end
end
