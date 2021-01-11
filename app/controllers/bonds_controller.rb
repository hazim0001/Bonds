class BondsController < ApplicationController
  before_action :set_bond, only: %i[show edit update destroy]


  def index
    # raise
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @bonds = Bond.where(sql_query, query: "%#{params[:query]}%")
    else
      @bonds = current_user.bonds.order(created_at: :desc)
    end
    @total = @bonds.sum(:amount_cents) / 100
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
    @bond = Bond.new(bond_params)
    set_period
    add_returns
    authorize @bond
    if @bond.save
      redirect_to asset_bonds_path(@bond.asset), notice: "Your bond has been created"
    else
      redirect_to asset_bonds_path(@bond.asset), alert: "Something went wrong "
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
    @bond.payouts.destroy_all
    @bond.destroy
    redirect_to asset_bonds_path(asset), notice: "Your bond has been deleted"
  end

  private

  def add_returns
    @bond.annual_return_cents = ((@bond.interest_rate / 100) * @bond.amount_cents).to_i
    if @bond.terms == "monthly"
      @bond.monthly_return_cents = (@bond.annual_return_cents / 12)
      @bond.compound_cents = (@bond.amount_cents * (1 + (@bond.interest_rate / 100) / 12)**(12 * @bond.period)).to_i
      # creating payouts
      counter = 1
      total_payouts = @bond.period * 12
      total_payouts.times do
        Payout.create(
          amount_cents: @bond.monthly_return_cents,
          bond: @bond,
          payout_date: @bond.start_date + counter.months
        )
        counter += 1
      end
    else
      @bond.quarterly_return_cents = (@bond.annual_return_cents / 4)
      @bond.compound_cents = (@bond.amount_cents * (1 + (@bond.interest_rate / 100) / 4)**(4 * @bond.period)).to_i
      # creating payouts
      payouts = [3]
      total_payouts_quarterly = @bond.period * 4
      (total_payouts_quarterly - 1).times do
        payouts << (payouts.last + 3)
      end
      payouts.each do |payout|
        Payout.create(
          amount_cents: @bond.quarterly_return_cents,
          bond: @bond,
          payout_date: @bond.start_date + payout.months
        )
      end
    end
  end

  def set_period
    @bond.period =  ((@bond.end_date - @bond.start_date) / 365).floor
  end

  def bond_params
    params.require(:bond).permit(:terms, :amount, :start_date, :end_date, :asset_id, :interest_rate, :period)
  end

  def set_bond
    @bond = Bond.find(params[:id])
  end


end
