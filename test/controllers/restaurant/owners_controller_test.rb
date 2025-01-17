require "test_helper"

class Restaurant::OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get restaurant_owners_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get restaurant_owners_unsubscribe_url
    assert_response :success
  end
end
