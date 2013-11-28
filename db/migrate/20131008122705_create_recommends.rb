class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.string :content
      t.integer :recommended_id
      t.integer :recommender_id

      t.timestamps
    end
  end
end
