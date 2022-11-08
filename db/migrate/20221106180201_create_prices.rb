class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :priceable, polymorphic: true, index: true, null: false
      t.float :price, null: false
      t.string :currency, null: false

      t.timestamps
    end
  end
end
