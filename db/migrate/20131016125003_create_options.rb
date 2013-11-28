class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.boolean :open_order
      t.string :long_short
      t.integer :contract
      t.string :put_call
      t.float :strike_price
      t.float :premium
      t.float :gain_loss

      t.timestamps
    end
  end
end
