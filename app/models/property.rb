class Property < ApplicationRecord
  belongs_to :asset

  monetize :value_cents
end
