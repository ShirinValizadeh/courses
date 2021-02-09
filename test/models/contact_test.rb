require "test_helper"

class ContactTest < ActiveSupport::TestCase

   test "creat contact wenn email ?" do

    contact = build(:contact, email: nil) 
    assert_not contact.valid?
  
  end

end
