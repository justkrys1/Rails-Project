require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get first_name" do
    get :first_name
    assert_response :success
  end

  test "should get last_name" do
    get :last_name
    assert_response :success
  end

  test "should get password" do
    get :password
    assert_response :success
  end

  test "should get newsletter" do
    get :newsletter
    assert_response :success
  end

end
