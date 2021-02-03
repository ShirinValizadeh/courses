require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index for logged out user" do
    get root_path
    assert_response :success

    #assert_no_match "Hello", response.body
  end

  test "should get index for logged in user" do
    # @user = create(:user)
    # sign_in @user

    sign_in create(:user)
    get root_path
    assert_response :success
    #assert_match "Hello", response.body
  end
end
