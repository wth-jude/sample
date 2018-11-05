require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invaild signup information" do
     get signup_path
  assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "", email: "user@invaild",
                                      password:   "foo",
                                      password_confirmation: "bar" } }
  end

  assert_template 'users/new'
  assert_select 'div.row'
  assert_select 'div#error_explanation'
 end

 test "valid signup information" do
   get signup_path
   assert_difference 'User.count', 1 do
     post users_path, params: { user: { name: "Example User",
                                email: "example@user.com",
                                password: "password",
                                password_confirmation: "password"} }
   end
   follow_redirect!
   assert_template 'users/show'
   assert_not flash.empty? 
   assert_not flash.alert
   assert_select 'aside.col-md-4'
   assert_select 'section.user_info'
 end
end
