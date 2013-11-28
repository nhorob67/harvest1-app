class AddFieldForRecommend < ActiveRecord::Migration
   def change
    add_column :recommends, :date, :datetime
    add_column :recommends, :content, :string
   end
end
