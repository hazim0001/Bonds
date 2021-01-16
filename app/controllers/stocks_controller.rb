class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @stocks = Stock.where(sql_query, query: "%#{params[:query]}%")
    else
      # raise
      @stocks = current_user.stocks.order(created_at: :desc)
    end
    @total = @stocks.sum(:cost_basis_cents)
    # @new_stock = Stock.new
  end

  def show
  end

  def new
  end

  def create
    @stock = Stock.new(stock_params)
    authorize @stock
    @stock.cost_basis_cents = @stock.position * @stock.average_price_cents
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
    asset = @stock.asset
    authorize @stock
    @stock.destroy
    redirect_to asset_stocks_path(asset), notice: "Your stock has been deleted"
  end

  private

  def stock_params
    params.require(:stock).permit(:symbol, :asset_id, :instrument, :average_price, :position)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
