class AddUserIdToHedgeToArrive < ActiveRecord::Migration
  def change
  	add_column :hedge_to_arrives, :user_id, :integer
  end
end
