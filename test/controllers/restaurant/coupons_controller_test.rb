require "test_helper"

class Restaurant::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurant_coupons_index_url
    assert_response :success
  end

  test "should get show" do
    get restaurant_coupons_show_url
    assert_response :success
  end
end
