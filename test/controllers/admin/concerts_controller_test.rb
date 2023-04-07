require "test_helper"

class Admin::ConcertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_concerts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_concerts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_concerts_destroy_url
    assert_response :success
  end
end
