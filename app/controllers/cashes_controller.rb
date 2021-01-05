class CashesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # raise
    @cash = Cash.new(cash_params)
    authorize @cash
    if @cash.save
      redirect_to asset_cashes_path(@cash.asset), notice: "Your deposit has been made"
    else
      redirect_to asset_cashes_path(@cash.asset), notice: "Your cash deposit has NOT been made"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cash_params
    params.require(:cash).permit(:sources, :amount, :asset_id)
  end

  def set_cash
    @bond = Cash.find(params[:id])
  end
end
