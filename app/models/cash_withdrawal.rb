class CashWithdrawal < ApplicationRecord
  belongs_to :cash

  monetize :amount_cents
end
