class CreateHedgeToArrives < ActiveRecord::Migration
  def change
    create_table :hedge_to_arrives do |t|
      t.boolean :open_order
      t.integer :bushels
      t.string :delivery_location
      t.string :future_month
      t.float :futures_price
      t.float :basic
      t.float :cash_price
      t.integer :contact_number
      t.float :percentage_production

      t.timestamps
    end
  end
end
