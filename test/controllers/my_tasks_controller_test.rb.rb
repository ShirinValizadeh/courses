require "test_helper"

class MyTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @assignee = create(:user)
    @my_task = create(:task, assignee: @assignee, user: @user )
    sign_in @user
  end

  test "should get index" do
    get my_tasks_url
    assert_response :success
    assert_match @my_task.title, response.body
  end



  test "should show task" do
    get my_task_url(@my_task)
    assert_response :success
  end


  test "should update task" do
    patch my_task_url(@my_task), params: { task: { title: @my_task.title } }
    assert_redirected_to my_task_url(@my_task)
  end

   test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete my_task_url(@my_task)
    end

    assert_redirected_to my_tasks_url
  end
end
