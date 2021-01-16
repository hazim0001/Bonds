require 'test_helper'

class CashesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cashes_index_url
    assert_response :success
  end

  test "should get show" do
    get cashes_show_url
    assert_response :success
  end

  test "should get new" do
    get cashes_new_url
    assert_response :success
  end

  test "should get create" do
    get cashes_create_url
    assert_response :success
  end

  test "should get edit" do
    get cashes_edit_url
    assert_response :success
  end

  test "should get update" do
    get cashes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cashes_destroy_url
    assert_response :success
  end

end
