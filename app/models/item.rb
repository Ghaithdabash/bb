class Item < ApplicationRecord
  belongs_to :cart
  belongs_to :parent_product, polymorphic: true

  validate :available_in_stock

  def available_in_stock
    errors.add(:base, "This quantity is not in stock.") if self.quantity.to_i > self.parent_product.try(:stock).to_i
  end
end
