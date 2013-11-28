class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.boolean :open_order
      t.integer :bushel
      t.string :delivery_location
      t.date :future_month
      t.decimal :basis
      t.decimal :cash_prise
      t.string :sale_duration
      t.integer :contract
      t.string :sale_type
      t.decimal :strike_price
      t.decimal :premium
      t.decimal :sale_income

      t.timestamps
    end
  end
end
