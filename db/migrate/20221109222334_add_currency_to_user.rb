class AddCurrencyToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :currency, :string
  end
end
