class Payout < ApplicationRecord
  belongs_to :bond
  monetize :amount_cents
end
