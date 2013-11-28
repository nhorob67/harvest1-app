class RenameFieldForRecommend < ActiveRecord::Migration
 def change
    rename_column :recommends, :content, :title_of_news_piece
  end
end
