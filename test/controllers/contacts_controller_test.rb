

class ContactsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @contact = create(:contact)
    end


    test 'should get new contact' do
        get new_contact_url
        assert_response :success
      end

      test 'should create contact' do
        assert_difference('Contact.count') do
          post contacts_url,
               params: { contact: { email: @contact.email, subject: @contact.subject,
                description: @contact.description } }
        end
  
        assert_redirected_to root_url
      end
end