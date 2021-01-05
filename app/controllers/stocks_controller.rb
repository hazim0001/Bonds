class StocksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @stock = Stock.new(stock_params)
    authorize @stock
    @stock.cost_basis = @stock.position * @stock.average_price
    if @stock.save
      redirect_to asset_stocks_path(@stock.asset), notice: "Your stock has been created"
    else
      redirect_to asset_stocks_path(@stock.asset), flash[:alert] = "Something went wrong 😔"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :asset_id, :instrument, :average_price, :position)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
