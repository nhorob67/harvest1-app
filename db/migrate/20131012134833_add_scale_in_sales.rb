class AddScaleInSales < ActiveRecord::Migration
  def up
  	 change_column :sales, :basis, :decimal, precision: 5, scale: 2
  	 change_column :sales, :cash_prise, :decimal, precision: 5, scale: 2
  	 change_column :sales, :strike_price, :decimal, precision: 5, scale: 2
  	 change_column :sales, :sale_income, :decimal, precision: 5, scale: 2
  	 
  end


  def down
  end
end
