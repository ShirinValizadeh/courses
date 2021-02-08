# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'the truth' do
    user = build(:user, email: nil, password: nil) # creat user wenn email ?
    assert_not user.valid?
  end
end
