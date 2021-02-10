require "test_helper"

class PostingTest < ActiveSupport::TestCase
   test "the truth" do

    posting = build(:posting) # posting.new
    assert posting.valid?

    posting = build(:posting, title: nil) # creat posting wenn title ?
    assert_not posting.valid?

   end
end
