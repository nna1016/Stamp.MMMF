require "test_helper"

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get friend_form_url
    assert_response :success
  end
  
end
