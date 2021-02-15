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

  test '#next_lesson returns next lesson' do
    course = create(:course)
    first_lesson = create(:lesson, course: course)
    second_lesson = create(:lesson, course: course)
    third_lesson = create(:lesson, course: course)

    assert_equal second_lesson, course.next_lesson(first_lesson)
    assert_equal third_lesson, course.next_lesson(second_lesson)
    assert_nil course.next_lesson(third_lesson)
  end
end
