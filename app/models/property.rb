class Property < ApplicationRecord
  belongs_to :asset

  monetize :value_cents
  monetize :rent_amount_cents
end
