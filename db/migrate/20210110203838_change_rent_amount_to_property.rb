class ChangeRentAmountToProperty < ActiveRecord::Migration[6.0]
  def change
    add_monetize :properties, :rent_amount, default: 0, currency: { present: false }
  end
end
