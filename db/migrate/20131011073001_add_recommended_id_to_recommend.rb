class AddRecommendedIdToRecommend < ActiveRecord::Migration
  def change
    add_column :recommends, :recommended_id, :integer
  end
end
