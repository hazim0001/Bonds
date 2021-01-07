class Asset < ApplicationRecord
  belongs_to :user

  has_one :cash
  has_many :bonds
  has_many :properties
  has_many :stocks
  has_many :cash_deposits, through: :cash
  has_many :cash_withdrawals, through: :cash
end
