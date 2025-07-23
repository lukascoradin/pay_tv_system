require "test_helper"

class BookletsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booklets_index_url
    assert_response :success
  end

  test "should get show" do
    get booklets_show_url
    assert_response :success
  end
end
