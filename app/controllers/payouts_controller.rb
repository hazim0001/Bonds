class PayoutsController < ApplicationController
  def index
    @payouts = current_user.payouts
  end
end
