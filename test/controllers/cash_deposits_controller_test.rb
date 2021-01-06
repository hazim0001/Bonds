require 'test_helper'

class CashDepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cash_deposits_new_url
    assert_response :success
  end

  test "should get create" do
    get cash_deposits_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cash_deposits_destroy_url
    assert_response :success
  end

  test "should get index" do
    get cash_deposits_index_url
    assert_response :success
  end

end
