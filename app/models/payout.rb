class Payout < ApplicationRecord
  belongs_to :bond
  monetize :amount
end
