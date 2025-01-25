require "test_helper"

class Public::PromotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_promotions_index_url
    assert_response :success
  end
end
