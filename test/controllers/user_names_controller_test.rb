require "test_helper"

class UserNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_name = user_names(:one)
  end

  test "should get index" do
    get user_names_url
    assert_response :success
  end

  test "should get new" do
    get new_user_name_url
    assert_response :success
  end

  test "should create user_name" do
    assert_difference("UserName.count") do
      post user_names_url, params: { user_name: { email: @user_name.email, login: @user_name.login } }
    end

    assert_redirected_to user_name_url(UserName.last)
  end

  test "should show user_name" do
    get user_name_url(@user_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_name_url(@user_name)
    assert_response :success
  end

  test "should update user_name" do
    patch user_name_url(@user_name), params: { user_name: { email: @user_name.email, login: @user_name.login } }
    assert_redirected_to user_name_url(@user_name)
  end

  test "should destroy user_name" do
    assert_difference("UserName.count", -1) do
      delete user_name_url(@user_name)
    end

    assert_redirected_to user_names_url
  end
end
