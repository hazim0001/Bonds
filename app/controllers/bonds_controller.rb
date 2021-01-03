class BondsController < ApplicationController
  before_action :set_bond, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @bonds = Bond.where(sql_query, query: "%#{params[:query]}%")
    else
      @bonds = Bond.all
    end
  end

  def show
    authorize @bond
  end

  def new
    @bond = Bond.new
    authorize @bond
  end

  def create
    @bond = Bond.new(bond_params)
    authorize @bond
    if @bond.save
      redirect_to @bond, notice: "Your bond has been created"
    else
      render :new
    end
  end

  def edit
    authorize @bond
  end

  def update
    authorize @bond
    if @bond.update(bond_params)
      redirect_to @bond, notice: "Your bond details have been updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @bond
    @bond.destroy
    redirect_to bonds_path, notice: "Your bond has been deleted"
  end

  private

  def bond_params
    params.require(:bond).permit(:terms, :amount, :start_date, :end_date)
  end

  def set_bond
    @bond = Bond.find(params[:id])
  end
end
