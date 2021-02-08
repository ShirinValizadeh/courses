# frozen_string_literal: true

require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test 'the truth' do
    lesson = build(:lesson, title: nil) # creat course wenn title ?
    assert_not lesson.valid?
  end
end
