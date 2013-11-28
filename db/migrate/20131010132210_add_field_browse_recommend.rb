class AddFieldBrowseRecommend < ActiveRecord::Migration
  def change
  	
  	add_attachment :recommends, :document
  end
end
