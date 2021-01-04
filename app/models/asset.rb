class Asset < ApplicationRecord
  belongs_to :user

  has_many :bonds
  has_many :cashes
  has_many :properties
  has_many :stocks
  has_many :cash_deposits, through: :cashes
end
