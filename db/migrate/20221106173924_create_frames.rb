class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :stock
      t.text :description

      t.timestamps
    end
  end
end
