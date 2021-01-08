class BondsController < ApplicationController
  before_action :set_bond, only: %i[show edit update destroy]

  def index
    # raise
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @bonds = Bond.where(sql_query, query: "%#{params[:query]}%")
    else
      # raise
      @bonds = current_user.bonds.order(start_date: :desc)
    end
    @total = @bonds.sum(:amount)
    @new_bond = Bond.new
  end

  def show
    authorize @bond
  end

  # def new
  #   @bond = Bond.new
  #   authorize @bond
  # end

  def create
    # raise
    @bond = Bond.new(bond_params)
    add_returns
    authorize @bond
    if @bond.save
      redirect_to asset_bonds_path(@bond.asset), notice: "Your bond has been created"
    else
      redirect_to asset_bonds_path(@bond.asset), flash[:alert] = "Something went wrong 😔"
    end
  end

  def edit
    authorize @bond
  end

  def update
    raise
    authorize @bond
    if @bond.update(bond_params)
      redirect_to @bond, notice: "Your bond details have been updated"
    else
      render :edit
    end
  end

  def destroy
    asset = @bond.asset
    authorize @bond
    @bond.destroy
    redirect_to asset_bonds_path(asset), notice: "Your bond has been deleted"
  end

  private

  def add_returns
    # A = P (1 + r/n)** (nt)
    # @bond.annual_return = (@bond.interest_rate / 100) * @bond.amount
    # if @bond.terms == "monthly"
    #   @bond.monthly_return = @bond.annual_return / 12
    #   @bond.compound = @bond.amount * (1 + (@bond.interest_rate / 100) / )
    # else
    #   @bond.quarterly_return = @bond.annual_return / 4
    # end
  end

  def bond_params
    params.require(:bond).permit(:terms, :amount, :start_date, :end_date, :asset_id, :interest_rate, :period)
  end

  def set_bond
    @bond = Bond.find(params[:id])
  end
end
