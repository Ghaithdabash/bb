class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, index: true, null: false
      t.references :parent_product, polymorphic: true, index: true, null: false
      t.integer :quantity
      t.decimal :rate
      t.decimal :total
      t.string :currency

      t.timestamps
    end
  end
end
