require "test_helper"

class Public::ConcertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_concerts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_concerts_show_url
    assert_response :success
  end

  test "should get new" do
    get public_concerts_new_url
    assert_response :success
  end

  test "should get create" do
    get public_concerts_create_url
    assert_response :success
  end

  test "should get confirm" do
    get public_concerts_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_concerts_complete_url
    assert_response :success
  end

  test "should get edit" do
    get public_concerts_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_concerts_update_url
    assert_response :success
  end
end
