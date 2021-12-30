require "test_helper"

class QuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get quest" do
    get quests_quest_url
    assert_response :success
  end
end
