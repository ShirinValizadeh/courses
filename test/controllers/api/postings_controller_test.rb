require "test_helper"

class Api::PostingsControllerTest < ActionDispatch::IntegrationTest
    
    setup do
      @admin = create(:admin , api_token: "abc123")
      @posting = create(:posting)
        
      end
        
    test "should get index" do
        get api_postings_url,headers:{Authorization: "Bearer abc123" }
        assert_response :success
      end


    test "should show posting" do
       get api_posting_url(@posting.id),headers:{Authorization: "Bearer abc123" }
       assert_response :success
    end
      
    test "should create posting" do  
        assert_difference('Posting.count') do  
          post api_postings_url,headers:{Authorization: "Bearer abc123" },
                params: { posting: { description: @posting.description, 
                        title: @posting.title } }
                end   
        assert_response :success
       end


    test "should destroy posting" do
        assert_difference("Posting.count", -1) do
        delete api_posting_url(@posting.id),headers:{Authorization: "Bearer abc123" }
        assert_response :success
        end
    end

    test "should update posting" do
        patch api_posting_url(@posting.id),headers:{Authorization: "Bearer abc123" }, params: { posting: { description: @posting.description, title: @posting.title } }
        assert_response :success

      end
end    