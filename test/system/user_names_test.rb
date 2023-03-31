require "application_system_test_case"

class UserNamesTest < ApplicationSystemTestCase
  setup do
    @user_name = user_names(:one)
  end

  test "visiting the index" do
    visit user_names_url
    assert_selector "h1", text: "User names"
  end

  test "should create user name" do
    visit user_names_url
    click_on "New user name"

    fill_in "Email", with: @user_name.email
    fill_in "Login", with: @user_name.login
    click_on "Create User name"

    assert_text "User name was successfully created"
    click_on "Back"
  end

  test "should update User name" do
    visit user_name_url(@user_name)
    click_on "Edit this user name", match: :first

    fill_in "Email", with: @user_name.email
    fill_in "Login", with: @user_name.login
    click_on "Update User name"

    assert_text "User name was successfully updated"
    click_on "Back"
  end

  test "should destroy User name" do
    visit user_name_url(@user_name)
    click_on "Destroy this user name", match: :first

    assert_text "User name was successfully destroyed"
  end
end
