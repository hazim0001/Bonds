class Bond < ApplicationRecord
  before_save :set_period

  belongs_to :asset
  has_many :payouts
  monetize :amount_cents
  monetize :annual_return_cents
  monetize :monthly_return_cents
  monetize :quarterly_return_cents
  monetize :compound_cents

  enum terms: {
    monthly: 'monthly',
    quarterly: 'quarterly'
  }

  validates :amount_cents, presence: true
  validates :interest_rate, presence: true, numericality: true

  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    errors.add(start_date, "End date must be greater than start date") if start_date >= end_date
  end

  private

  def set_period
    self.period =  ((end_date - start_date) / 365).floor
  end

end
