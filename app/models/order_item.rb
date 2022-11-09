class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :parent_product, polymorphic: true

  validates_presence_of :quantity, :rate, :currency, :total
end
