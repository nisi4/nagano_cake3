class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivary: 3, delivered: 4 }
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  def postage
    self.postage = 500
  end
end
