class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :cart, index: true, null: false
      t.references :parent_product, polymorphic: true, index: true, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
