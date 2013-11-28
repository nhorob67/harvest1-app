class CreateFutures < ActiveRecord::Migration
  def change
    create_table :futures do |t|
      t.boolean :open_order
      t.string :long_short
      t.integer :contract
      t.string :future_month
      t.float :futures_price
      t.float :gain_loss

      t.timestamps
    end
  end
end
