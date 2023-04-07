require "test_helper"

class Public::RevuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_revues_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_revues_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_revues_create_url
    assert_response :success
  end

  test "should get update" do
    get public_revues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_revues_destroy_url
    assert_response :success
  end
end
