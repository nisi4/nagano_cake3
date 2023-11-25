class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def subtotal_price
    item.tax_included_price*amount
  end
end
