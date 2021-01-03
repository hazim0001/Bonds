class BondsController < ApplicationController
  before_action :set_bond, only: %i[show edit update destroy]

  private

  def bond_params
    params.require(:bond).permit(:terms, :amount, :start_date, :end_date)
  end

  def set_bond
    @bond = Bond.find(params[:id])
  end
end
