class ChangeFormatInSales < ActiveRecord::Migration
  def up
  	 change_column :sales, :premium, :decimal, precision: 5, scale: 2
  end

  def down
  end
end
