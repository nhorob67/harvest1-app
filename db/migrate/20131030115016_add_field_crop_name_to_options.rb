class AddFieldCropNameToOptions < ActiveRecord::Migration
  def change
  	add_column :options, :crop_name, :string
  end
end
