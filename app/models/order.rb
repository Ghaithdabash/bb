class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def self.place_order(cart:, user:)
    if cart.present?
      begin
        transaction do
          new_order = user.orders.create!

          cart.items.includes(parent_product: :prices).each do |item|
            product = item.parent_product
            price_obj = product.prices.find_by(currency: user.currency)

            new_order.order_items.create!(parent_product_id: item.parent_product_id,
                                          parent_product_type: item.parent_product_type,
                                          quantity: item.quantity,
                                          rate: price_obj.price,
                                          currency: user.currency,
                                          total: price_obj.price.to_d * item.quantity.to_i)
            product.update(stock: product.stock - item.quantity)
            item.destroy!
          end
          new_order
        end
      rescue ActiveRecord::RecordInvalid => e
        e
      end
    end
  end
end
