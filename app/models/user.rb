class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :asset
  has_many :bonds, through: :asset
  has_one :cash, through: :asset
  has_many :cash_deposits, through: :cash
  has_many :cash_withdrawals, through: :cash
  has_many :properties, through: :asset
  has_many :stocks, through: :asset
end
