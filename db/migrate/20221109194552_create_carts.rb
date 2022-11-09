class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
