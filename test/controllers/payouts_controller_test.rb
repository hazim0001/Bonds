require 'test_helper'

class PayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payouts_index_url
    assert_response :success
  end

end
