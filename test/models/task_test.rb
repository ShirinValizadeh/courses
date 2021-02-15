require "test_helper"

class TaskTest < ActiveSupport::TestCase
   test "the truth" do
    task = build(:task, user: nil) # creat task wenn user ?
    assert_not task.valid?

    task = build(:task, title: nil) # creat task wenn title ?
    assert_not task.valid?

   end
end
