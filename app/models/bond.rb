class Bond < ApplicationRecord
  belongs_to :asset

  enum terms: {
    monthly: 'monthly',
    quarterly: 'quarterly'
  }

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :interest_rate, presence: true, numericality: true

  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    errors.add(start_date, "End date must be greater than start date") if start_date >= end_date
  end
end
