class CreateForwardContracts < ActiveRecord::Migration
  def change
    create_table :forward_contracts do |t|
      t.boolean :open_order
      t.integer :bushels
      t.string :delivery_location
      t.string :delivery_period
      t.float :futures_price
      t.float :basic
      t.float :cash_price
      t.integer :contact_number
      t.float :percentage_production

      t.timestamps
    end
  end
end
