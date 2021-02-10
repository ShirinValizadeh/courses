require "test_helper"

class PostingsControllerTest < ActionDispatch::IntegrationTest


  test "should get index" do
    get postings_url
    assert_response :success
  end


end
