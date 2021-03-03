require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome_email" do
    contact = create(:contact)
    email = UserMailer.with(contact: contact).welcome_email


    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ["shirinvalizadeh6004@gmail.com"], email.from
    assert_equal [contact.email], email.to
    
  
  end
end
