class AssetsController < ApplicationController
  def index
    Asset.create(user: current_user, total_value: 0) unless current_user.asset.present?
    @new_bond = Bond.new
    @new_cash = Cash.new
    @new_property = Property.new
    @new_stock = Stock.new
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end