class Property < ApplicationRecord
  belongs_to :asset

  monetize :value_cents
  monetize :rent_amount_cents

  validate :if_rented_rent_amount_must_be_present,
  :if_rent_amount_present_its_rented


  def if_rented_rent_amount_must_be_present
    if rented && rent_amount_cents <= 0
      errors.add(:rented, "if its rented there should be a value")
    end
  end

  def if_rent_amount_present_its_rented
    if rented == false && rent_amount_cents > 0
      errors.add(:rented,"if it has a rent, it must be rented then")
    end
  end
end
