class AddUserIdToBasisContract < ActiveRecord::Migration
  def change
  	add_column :basic_contracts, :user_id, :integer
  end
end
