class CashTransaction < ApplicationRecord
  belongs_to :user

  enum action: {
    deposit: 'deposit',
    withdraw: 'withdraw'
  }
end
