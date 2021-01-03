class Bond < ApplicationRecord
  belongs_to :user

  enum terms: {
    monthly: 'monthly',
    quarterly: 'quarterly'
  }
end
