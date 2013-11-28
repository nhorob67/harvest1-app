class AddFieldToRecommend < ActiveRecord::Migration
  def change
    add_column :recommends, :user_id, :integer
  end
end
