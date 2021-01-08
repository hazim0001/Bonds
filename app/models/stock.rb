class Stock < ApplicationRecord
  belongs_to :asset

  monetize :cost_basis_cents
  monetize :average_price_cents
end
