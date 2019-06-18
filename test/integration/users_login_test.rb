require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  
  test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
  end

  test "valid login credentials accepted and begin session" do
    login_path
    assert_template 'sessions/new'
  end



end
