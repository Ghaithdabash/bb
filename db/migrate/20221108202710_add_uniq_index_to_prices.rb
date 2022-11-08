class AddUniqIndexToPrices < ActiveRecord::Migration[7.0]
  def change
    add_index :prices, [:currency, :priceable_id, :priceable_type], unique: true
  end
end
