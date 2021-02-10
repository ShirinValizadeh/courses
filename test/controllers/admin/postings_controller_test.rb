require "test_helper"

module Admin

class PostingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create(:admin)
    @posting = create(:posting)

   sign_in @admin
    
  end

  test "should get index" do
    get admin_postings_url
    assert_response :success
    assert_match @posting.title, response.body  #check body from title
  end

  test "should get new" do
    get new_admin_posting_url
    assert_response :success
  end

  test "should create posting" do
    assert_difference('Posting.count') do
      post admin_postings_url,
            params: { posting: { description: @posting.description, 
                    title: @posting.title } }
    end

     assert_redirected_to admin_postings_url
   end

  test "should show posting" do
    get admin_posting_url(@posting)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_posting_url(@posting)
    assert_response :success
  end

  test "should update posting" do
    patch admin_posting_url(@posting),
     params: { posting: { description: @posting.description, title: @posting.title } }
    assert_redirected_to admin_postings_url
  end

  test "should destroy posting" do
    assert_difference('Posting.count', -1) do
      delete admin_posting_url(@posting)
    end

    assert_redirected_to admin_postings_url
  end
end

end