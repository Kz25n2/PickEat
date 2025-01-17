require "test_helper"

class Restaurant::PromotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get promotion" do
    get restaurant_promotions_promotion_url
    assert_response :success
  end
end
