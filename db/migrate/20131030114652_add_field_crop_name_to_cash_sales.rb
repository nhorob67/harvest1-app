class AddFieldCropNameToCashSales < ActiveRecord::Migration
  def change
  	add_column :cash_sales, :crop_name, :string
  	
  end
end
