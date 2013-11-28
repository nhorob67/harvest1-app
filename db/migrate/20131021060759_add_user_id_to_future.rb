class AddUserIdToFuture < ActiveRecord::Migration
  def change
  	add_column :futures, :user_id, :integer
  end
end
