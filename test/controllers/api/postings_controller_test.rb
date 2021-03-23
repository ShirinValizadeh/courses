require "test_helper"

class Api::PostingsControllerTest < ActionDispatch::IntegrationTest
    
    setup do
        @user = create(:user)
        @admin = create(:admin)
        @posting = create(:posting , user: @admin)
    
       sign_in @admin
       
      end
        
    test "should get index" do
        get api_postings_url
        assert_response :success
      end


    test "should show posting" do
       get api_posting_url(@posting.id)
       assert_response :success
    end
      
    test "should create posting" do  
        assert_difference('Posting.count') do     
          post api_postings_url,
                params: { posting: { description: @posting.description, 
                        title: @posting.title } }
                end   
        assert_response :success
       end


    test "should destroy posting" do
        assert_difference("Posting.count", -1) do
        delete api_posting_url(@posting.id)
        assert_response :success
        end
    end

    test "should update posting" do
        patch api_posting_url(@posting.id), params: { posting: { description: description, title: "new title" } }
        assert_response :success
        json = JSON.parse response.body
        assert_equal [], json["body"]["blocks"]
        assert_equal "new title", json["title"]
      end
end    