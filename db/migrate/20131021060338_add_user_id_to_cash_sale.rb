class AddUserIdToCashSale < ActiveRecord::Migration
  def change
  	add_column :cash_sales, :user_id, :integer
  end
end
