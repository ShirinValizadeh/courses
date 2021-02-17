require "application_system_test_case"

class CompletedlessonsTest < ApplicationSystemTestCase
  setup do
    @completedlesson = completedlessons(:one)
  end

  test "visiting the index" do
    visit completedlessons_url
    assert_selector "h1", text: "Completedlessons"
  end

  test "creating a Completedlesson" do
    visit completedlessons_url
    click_on "New Completedlesson"

    click_on "Create Completedlesson"

    assert_text "Completedlesson was successfully created"
    click_on "Back"
  end

  test "updating a Completedlesson" do
    visit completedlessons_url
    click_on "Edit", match: :first

    click_on "Update Completedlesson"

    assert_text "Completedlesson was successfully updated"
    click_on "Back"
  end

  test "destroying a Completedlesson" do
    visit completedlessons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Completedlesson was successfully destroyed"
  end
end
