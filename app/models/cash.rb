class Cash < ApplicationRecord
  belongs_to :asset
  has_many :cash_deposits
  has_many :cash_withdrawals

  monetize :amount_cents
end
