require "test_helper"

class SusbscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get susbscriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get susbscriptions_show_url
    assert_response :success
  end

  test "should get new" do
    get susbscriptions_new_url
    assert_response :success
  end

  test "should get create" do
    get susbscriptions_create_url
    assert_response :success
  end

  test "should get edit" do
    get susbscriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get susbscriptions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get susbscriptions_destroy_url
    assert_response :success
  end
end
