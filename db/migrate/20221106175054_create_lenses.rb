class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :color
      t.integer :prescription_type, default: 0
      t.integer :lens_type, default: 0
      t.integer :stock
      t.text :description

      t.timestamps
    end
  end
end
