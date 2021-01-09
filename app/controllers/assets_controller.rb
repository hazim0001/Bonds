class AssetsController < ApplicationController
  def index
    Asset.create(user: current_user, total_value_cents: 0) unless current_user.asset.present?
    @new_bond = Bond.new
    @new_cash = Cash.new
    @new_property = Property.new
    @new_stock = Stock.new
    @asset = current_user.asset
    @bonds = @asset.bonds
  end
end
