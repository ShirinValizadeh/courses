# frozen_string_literal: true

require 'application_system_test_case'

class LessonsTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
  end

  test 'creating a Lesson' do
    visit lessons_url
    click_on 'New lesson'

    fill_in 'Body', with: @lesson.body
    fill_in 'Title', with: @lesson.title
    click_on 'Create Lesson'

    assert_text 'Lesson was successfully created'
    click_on 'Back'
  end

  test 'updating a Lesson' do
    visit lessons_url
    click_on 'Edit', match: :first

    fill_in 'Body', with: @lesson.body
    fill_in 'Title', with: @lesson.title
    click_on 'Update Lesson'

    assert_text 'Lesson was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Lesson' do
    visit lessons_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Lesson was successfully destroyed'
  end
end
