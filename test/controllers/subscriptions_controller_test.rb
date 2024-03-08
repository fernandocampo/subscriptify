require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscriptions_index_url
    assert_response :success
  end

  test "should get new" do
    get subscriptions_new_url
    assert_response :success
  end

  test "should get show" do
    get subscriptions_show_url
    assert_response :success
  end

  test "should get create" do
    get subscriptions_create_url
    assert_response :success
  end

  test "should get edit" do
    get subscriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get subscriptions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get subscriptions_destroy_url
    assert_response :success
  end
end
