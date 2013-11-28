class AddUserIdToForwardContract < ActiveRecord::Migration
  def change
  	add_column :forward_contracts, :user_id, :integer
  end
end
