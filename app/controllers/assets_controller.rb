class AssetsController < ApplicationController
  def index
    Asset.create(user: current_user, total_value_cents: 0) unless current_user.asset.present?
    @asset = current_user.asset
    Cash.create(asset: @asset) unless current_user.cash.present?
    @new_bond = Bond.new
    @new_property = Property.new
    @new_stock = Stock.new
    @new_cash = Cash.new
  end
end
