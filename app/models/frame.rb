class Frame < ApplicationRecord
  has_many :prices, as: :priceable, dependent: :destroy
  has_many :items, as: :parent_product, dependent: :destroy
  has_many :order_items, as: :parent_product, dependent: :destroy

  validates_presence_of :name, :stock

  enum status: [ :active, :inactive ]

  accepts_nested_attributes_for :prices, allow_destroy: true
end
