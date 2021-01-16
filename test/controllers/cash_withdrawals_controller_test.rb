require 'test_helper'

class CashWithdrawalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cash_withdrawals_new_url
    assert_response :success
  end

  test "should get create" do
    get cash_withdrawals_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cash_withdrawals_destroy_url
    assert_response :success
  end

  test "should get index" do
    get cash_withdrawals_index_url
    assert_response :success
  end

end
