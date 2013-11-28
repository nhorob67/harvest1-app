class RemoveFieldForRecommend < ActiveRecord::Migration
 def change
    remove_column :recommends, :recommended_id
    remove_column :recommends, :recommender_id
 end
end
