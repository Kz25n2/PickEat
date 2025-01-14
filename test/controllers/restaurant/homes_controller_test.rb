require "test_helper"

class Restaurant::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get restaurant_homes_top_url
    assert_response :success
  end
end
