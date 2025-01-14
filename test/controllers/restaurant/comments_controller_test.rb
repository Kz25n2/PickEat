require "test_helper"

class Restaurant::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurant_comments_index_url
    assert_response :success
  end

  test "should get edit" do
    get restaurant_comments_edit_url
    assert_response :success
  end
end
