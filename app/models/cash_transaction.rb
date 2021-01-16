class CashTransaction < ApplicationRecord
  belongs_to :user

  monetize :amount_cents

  enum action: {
    deposit: 'deposit',
    withdraw: 'withdraw'
  }
end
