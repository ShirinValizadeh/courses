require "test_helper"

class CompletedlessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @completedlesson = completedlessons(:one)
  end

  test "should get index" do
    get completedlessons_url
    assert_response :success
  end

  test "should get new" do
    get new_completedlesson_url
    assert_response :success
  end

  test "should create completedlesson" do
    assert_difference('Completedlesson.count') do
      post completedlessons_url, params: { completedlesson: {  } }
    end

    assert_redirected_to completedlesson_url(Completedlesson.last)
  end

  test "should show completedlesson" do
    get completedlesson_url(@completedlesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_completedlesson_url(@completedlesson)
    assert_response :success
  end

  test "should update completedlesson" do
    patch completedlesson_url(@completedlesson), params: { completedlesson: {  } }
    assert_redirected_to completedlesson_url(@completedlesson)
  end

  test "should destroy completedlesson" do
    assert_difference('Completedlesson.count', -1) do
      delete completedlesson_url(@completedlesson)
    end

    assert_redirected_to completedlessons_url
  end
end
