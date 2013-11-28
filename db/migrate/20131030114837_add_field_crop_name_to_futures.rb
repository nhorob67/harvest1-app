class AddFieldCropNameToFutures < ActiveRecord::Migration
  def change
  	add_column :futures, :crop_name, :string
  end
end
