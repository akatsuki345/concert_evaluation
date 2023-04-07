require "test_helper"

class Admin::RevuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_revues_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_revues_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_revues_destroy_url
    assert_response :success
  end
end
