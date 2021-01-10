class PayoutsController < ApplicationController
  def index
    @asset = current_user.asset
    @payouts = current_user.payouts
  end
end
