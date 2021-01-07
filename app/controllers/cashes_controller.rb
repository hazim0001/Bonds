class CashesController < ApplicationController
  before_action :set_cash, only: %i[show edit update destroy]
  def index
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @cash = cash.where(sql_query, query: "%#{params[:query]}%")
    else
      @cash = current_user.cash
    end
    @total = @cash.amount.round(2)
    @new_deposit = CashDeposit.new
    @new_withdrawal = CashWithdrawal.new
    # @new_cash = Cash.new
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
    asset = @cash.asset
    authorize @cash
    @cash.destroy
    redirect_to asset_cashes_path(asset), notice: "Your deposit has been deleted"
  end

  private

  def cash_params
    params.require(:cash).permit(:sources, :amount, :asset_id)
  end

  def set_cash
    @cash = Cash.find(params[:id])
  end
end
