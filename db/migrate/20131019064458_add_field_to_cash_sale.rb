class AddFieldToCashSale < ActiveRecord::Migration
  def change
    add_column :cash_sales, :year, :integer
  end
end
